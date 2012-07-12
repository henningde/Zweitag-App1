require 'open-uri'
require 'pry'
module ApiModule

	class LoadConnectionError < StandardError; end
	class ParseNokogiriError < StandardError; end
	class ParseError < StandardError; end

	attr_accessor :url,:doc


	def load_data
		# binding.pry
		encoded = URI.encode(@url)
		@doc = open(encoded){ |f| f.read }
		rescue OpenURI::HTTPError
			raise LoadConnectionError, "Could not reach the API."
		rescue Errno::ENOENT
			raise LoadConnectionError, "Could not find an JSON File"
	end



	def parse_json


			@json_code = JSON.parse(@doc)

		rescue JSON::ParserError
			raise ParseError, "Could not parse JSON File"
	end

	def parse_xml
			
#puts @doc
			@xml_code = Nokogiri::XML(@doc)
			@xml_code.encoding = 'utf-8'
			@xml_code.remove_namespaces!
#puts @xml_code
		rescue Errno::ENOENT
			raise ParseNokogiriError, "Could not find an XML File"
	
	end
	

	def data
		if @data
			@data
		else
			load_unless_already_loaded
			@data
		end
	end

	
		def load_unless_already_loaded

		unless @data
			@data=Hash.new
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