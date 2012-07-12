# coding: utf-8
require_relative 'api_module.rb'

class Panoramio
	include ApiModule

attr_accessor :json_code

	def format
		:json
	end

	def initialize( url=nil)
	 	@url = url
		@url||= "http://www.panoramio.com/map/get_panoramas.php?set=public&from=0&to=20&minx=-180&miny=-90&maxx=180&maxy=90&size=medium&mapfilter=true"
	end


	def read_parameters
		@data||=Hash.new
		photos = @json_code["photos"].first
		@data[:photo_title] = photos["photo_title"]
		@data[:photo_url] = photos["photo_url"]
		@data[:photo_file_url] = photos["photo_file_url"]
		@data
	end




	def photo_title
		data[:photo_title]
	end

	def photo_url
		data[:photo_url]
	end

	def photo_file_url
		data[:photo_file_url]
	end


end


