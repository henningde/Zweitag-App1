# coding: utf-8
require 'nokogiri'
require_relative 'api_module.rb'

class Weather
	include ApiModule

attr_accessor :xml_code
	def format
		:xml
	end

	def initialize(location, url=nil)
	 	@url = url
		@location= location
		@url||= "http://www.google.com/ig/api?weather=#{@location}&hl=de"
		
	end

	

	def read_parameters
	@data||=Hash.new
		current_node = @xml_code.xpath("//xml_api_reply/weather/current_conditions").first
		@data[:condition]= current_node.xpath('./condition/@data').to_s

		@data[:temp_c] = current_node.xpath('./temp_c/@data').to_s.to_i


		@data[:humidity]= current_node.xpath('./humidity/@data').to_s

		current_node = @xml_code.xpath("//xml_api_reply/weather/forecast_conditions[2]").first
		temp_tomorrow_low= current_node.xpath('./low/@data')
		temp_tomorrow_high=current_node.xpath('./high/@data')
					
		@data[:temperatur_tomorrow] =(temp_tomorrow_low.to_s.to_i+ temp_tomorrow_high.to_s.to_i)/2
	@data
	end


	 

	def temperatur
		data[:temp_c]
	end

	def condition
		data[:condition]
	end

	def humidity
		data[:humidity]
	end

	def temperatur_tomorrow
		data[:temperatur_tomorrow]
	end

end

