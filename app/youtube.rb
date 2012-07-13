# coding: utf-8
require 'nokogiri'
require 'pry'
require_relative 'api_module.rb'

class YouTube
	include ApiModule

attr_accessor :xml_code
	def format
		:xml
	end
	def initialize(location, url=nil)
	 	@url = url
		@location= location
		@url||= "https://gdata.youtube.com/feeds/api/videos?q=#{@location}"
	end


	def read_parameters
		@data||=Hash.new
		current_node = @xml_code.xpath("//feed/entry[1]")
		@data[:video_id] = current_node.xpath('./id/text()').to_s

		@data[:title] = current_node.xpath('./title/text()').to_s

		@data[:link] = current_node.xpath("./group/content[1]/@url").to_s

		# binding.pry
		@data

	end

 

	def video_id
		data[:video_id]
	end

	def title
		data[:title]
	end

	def link
		data[:link]
	end



end