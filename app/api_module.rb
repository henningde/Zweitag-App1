require 'open-uri'
module ApiModule

	class LoadConnectionError < StandardError; end
	class ParseNokogiriError < StandardError; end
	class ParseError < StandardError; end

	private
	def load_data
		@doc = open(URI.encode(@url)){ |f| f.read }

		rescue OpenURI::HTTPError
			raise LoadConnectionError, "Could not reach the API."
		rescue Errno::ENOENT
			raise LoadConnectionError, "Could not find an JSON File"
	end


	def parse_json
			@data=Hash.new

			@json_code = JSON.parse(@doc)


		rescue JSON::ParserError
			raise ParseError, "Could not parse JSON File"
	end

	def parse_xml
			@data=Hash.new

			@xml_code = Nokogiri::XML(@doc)
			@xml_code.encoding = 'utf-8'
			@xml_code.remove_namespaces!

		rescue Errno::ENOENT
			raise ParseNokogiriError, "Could not find an XML File"
	
	end

	public
		def load_unless_already_loaded(format)

		unless @data
			load_data
			if format == :json
			parse_json
			
		elsif format == :xml
			parse_xml

		end
		read_parameters


		end
	end


end