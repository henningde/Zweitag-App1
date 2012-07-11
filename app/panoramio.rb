# coding: utf-8
require 'nokogiri'
require_relative 'api_module.rb'

class Panoramio
	include ApiModule


	def initialize( url=nil)
	 	@url = url
		@url||= "http://www.panoramio.com/map/get_panoramas.php?set=public&from=0&to=20&minx=-180&miny=-90&maxx=180&maxy=90&size=medium&mapfilter=true"
	end

	private

	def read_parameters
		photos = @json_code["photos"].first
		@data[:photo_title] = photos["photo_title"]
		@data[:photo_url] = photos["photo_url"]
		@data[:photo_file_url] = photos["photo_file_url"]
	end

	public 

	def photo_title
		load_unless_already_loaded(:json)
		@data[:photo_title]
	end

	def photo_url
		load_unless_already_loaded(:json)
		@data[:photo_url]
	end

	def photo_file_url
		load_unless_already_loaded(:json)
		@data[:photo_file_url]
	end


end


