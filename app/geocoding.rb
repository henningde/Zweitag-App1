# coding: utf-8


require_relative 'api_module.rb'


class Geocoding
	include ApiModule

attr_accessor :json_code
	def format
		:json
	end

	def initialize(location, url=nil)
		@url=url
		@location= location
		@url||= "http://maps.googleapis.com/maps/api/geocode/json?address=#{@location}&sensor=true"	
	end
	


	def read_parameters
		@data||=Hash.new
		if @json_code["status"]!="ZERO_RESULTS"
			location = @json_code["results"].first["geometry"]["location"]
			@data[:longitude] = location["lng"]
			@data[:latitude]  = location["lat"]
			
		end
		@data
	end

	public 

	def longitude 
		data[:longitude]
	end

	def latitude 
		data[:latitude]
	end

end


