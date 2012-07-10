# coding: utf-8
require 'nokogiri'
require 'open-uri'

class Weather

	def initialize(string, url=nil)
		@url = url
		@string= string
		@url||= "http://www.google.com/ig/api?weather=#{@string}"
	end

	def loadXML
		begin
			@doc = Nokogiri::HTML(open(URI.encode(@url)))
			@doc.encoding = 'utf-8'
	
			# xml_data = Net::HTTP.get_response(URI.parse(@url)).body

			# # extract event information
			# @doc = REXML::Document.new(xml_data)
		rescue StandardError
			""
		end
	end

	def parseXML



			@data=Hash.new
			condition= @doc.xpath('//xml_api_reply/weather/current_conditions/condition')
			@data[:condition] = condition[0].attributes["data"]
			
			temp_c= @doc.xpath('//xml_api_reply/weather/current_conditions/temp_c')
			@data[:temp_c] =temp_c[0].attributes["data"]
			humidity= @doc.xpath('//xml_api_reply/weather/current_conditions/humidity')
			@data[:humidity] = humidity[0].attributes["data"]

			puts @data[:temp_c]
	end
end

reader =Weather.new("münster")
reader.loadXML
# puts reader.loadXML
reader.parseXML




# class Weather
# 	def greet
# 		"Hello"
# 	end
# end