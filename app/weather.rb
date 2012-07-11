# coding: utf-8
require 'nokogiri'
require 'open-uri'

class Weather

	class LoadConnectionError < StandardError; end
	class ParseNokogiriError < StandardError; end

	def initialize(location, url=nil)
	 	@url = url
		@location= location
		@url||= "http://www.google.com/ig/api?weather=#{@location}&hl=de"
	end

	private
	
	def load_xml

			@doc = Nokogiri::XML(open(URI.encode(@url)))
			@doc.encoding = 'utf-8'

		rescue OpenURI::HTTPError
			raise LoadConnectionError, "Could not reach the API."
		rescue Errno::ENOENT
			raise ParseNokogiriError, "Could not find an XML File"
		
	end

	def parse_xml
		@data=Hash.new

		@data[:condition]= @doc.xpath('//xml_api_reply/weather/current_conditions/condition/@data')

		@data[:temp_c] = @doc.xpath('//xml_api_reply/weather/current_conditions/temp_c/@data')

		@data[:humidity]= @doc.xpath('//xml_api_reply/weather/current_conditions/humidity/@data')


		temp_tomorrow_low= @doc.xpath('//xml_api_reply/weather/forecast_conditions[2]/low/@data')
		temp_tomorrow_high=@doc.xpath('//xml_api_reply/weather/forecast_conditions[2]/high/@data')
				
		@data[:temperatur_tomorrow] =(temp_tomorrow_low.to_s.to_i+ temp_tomorrow_high.to_s.to_i)/2
	end

	def load_unless_already_loaded
		unless @data
			load_xml
			parse_xml
		end
	end

	public 

	def temperatur
		load_unless_already_loaded
		@data[:temp_c]
	end

	def condition
		load_unless_already_loaded
		@data[:condition]
	end

	def humidity
		load_unless_already_loaded
		@data[:humidity]
	end

	def temperatur_tomorrow
		load_unless_already_loaded
		@data[:temperatur_tomorrow]
	end

end

weather =  Weather.new("münster")

puts "Temp: #{weather.temperatur}"
puts "Temp tomorrow: #{weather.temperatur_tomorrow}"