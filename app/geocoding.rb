# coding: utf-8
require 'json'

require_relative 'api_module.rb'


class Geocoding
	include ApiModule



	def initialize(location, url=nil)
	 	@url = url
		@location= location
		@url||= "http://maps.googleapis.com/maps/api/geocode/json?address=#{@location}&sensor=true"	
	end
	


	def read_parameters

			location = @json_code["results"].first["geometry"]["location"]
			@data[:longitude] = location["lng"]
			@data[:latitude]  = location["lat"]
	end

	public 

	def longitude 
		load_unless_already_loaded(:json)
		@data[:longitude]
	end

	def latitude 
		load_unless_already_loaded(:json)
		@data[:latitude]
	end

end


