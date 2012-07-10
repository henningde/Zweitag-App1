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
			condition= @doc.xpath('//xml_api_reply/weather/current_conditions/condition')
			puts "condition: #{condition[0].attributes["data"]}"
			temp_c= @doc.xpath('//xml_api_reply/weather/current_conditions/temp_c')
			puts "temp: #{temp_c[0].attributes["data"]}"
			humidity= @doc.xpath('//xml_api_reply/weather/current_conditions/humidity')
			puts "humidity: #{humidity[0].attributes["data"]}"
	end
end

reader =Weather.new("münster")
reader.loadXML
# puts reader.loadXML
puts reader.parseXML



# class Weather
# 	def greet
# 		"Hello"
# 	end
# end