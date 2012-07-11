# coding: utf-8
require 'open-uri'
require 'json'

class Geocoding

	class LoadConnectionError < StandardError; end
	class ParseError < StandardError; end

	def initialize(location, url=nil)
	 	@url = url
		@location= location
		@url||= "http://maps.googleapis.com/maps/api/geocode/json?address=#{@location}&sensor=true"	
	end

	private
	
	def load_json
		
		@doc = open(URI.encode(@url)){ |f| f.read }
		rescue OpenURI::HTTPError
			raise LoadConnectionError, "Could not reach the API."
		rescue Errno::ENOENT
			raise LoadConnectionError, "Could not find an XML File"
		
	end

	def parse_json
			@data=Hash.new
			json_code = JSON.parse(@doc)
			@data[:longitude] = json_code["results"].first["geometry"]["location"]["lng"]
			@data[:latitude]  = json_code["results"].first["geometry"]["location"]["lat"]
		rescue JSON::ParserError
			raise ParseError, "Could not parse XML File"
	end

	def load_unless_already_loaded
		unless @data
			load_json
			parse_json
		end
	end

	public 

	def longitude 
		load_unless_already_loaded
		@data[:longitude]
	end

	def latitude 
		load_unless_already_loaded
		@data[:latitude]
	end

end

geocoding =  Geocoding.new("münster")

puts "Lng: #{geocoding.longitude}"
puts "Lat: #{geocoding.latitude}"

# puts weather.condition
