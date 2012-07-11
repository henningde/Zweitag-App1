# coding: utf-8
require 'nokogiri'
require_relative 'api_module.rb'

class Weather
	include ApiModule




	def initialize(location, url=nil)
	 	@url = url
		@location= location
		@url||= "http://www.google.com/ig/api?weather=#{@location}&hl=de"
	end

	private

	def read_parameters

		current_node = @xml_code.xpath("//xml_api_reply/weather/current_conditions").first
		@data[:condition]= current_node.xpath('./condition/@data')

		@data[:temp_c] = current_node.xpath('./temp_c/@data')

		@data[:humidity]= current_node.xpath('./humidity/@data')

		current_node = @xml_code.xpath("//xml_api_reply/weather/forecast_conditions[2]").first
		temp_tomorrow_low= current_node.xpath('./low/@data')
		temp_tomorrow_high=current_node.xpath('./high/@data')
					
		@data[:temperatur_tomorrow] =(temp_tomorrow_low.to_s.to_i+ temp_tomorrow_high.to_s.to_i)/2
	end


	public 

	def temperatur
		load_unless_already_loaded(:xml)
		@data[:temp_c]
	end

	def condition
		load_unless_already_loaded(:xml)
		@data[:condition]
	end

	def humidity
		load_unless_already_loaded(:xml)
		@data[:humidity]
	end

	def temperatur_tomorrow
		load_unless_already_loaded(:xml)
		@data[:temperatur_tomorrow]
	end

end

