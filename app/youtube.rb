# coding: utf-8
require 'nokogiri'
require 'pry'
require_relative 'api_module.rb'

class YouTube
	include ApiModule


	def initialize(location, url=nil)
	 	@url = url
		@location= location
		@url||= "https://gdata.youtube.com/feeds/api/videos?q=#{@location}"
	end

	private

	def read_parameters

		current_node = @xml_code.xpath("//feed/entry[1]")
		@data[:video_id] = current_node.xpath('./id/text()')

		@data[:title] = current_node.xpath('./title/text()')

		@data[:link] = current_node.xpath("./link[@rel='alternate']/@href")
		# binding.pry

	end


	public 

	def video_id
		load_unless_already_loaded(:xml)
		@data[:video_id]
	end

	def title
		load_unless_already_loaded(:xml)
		@data[:title]
	end

	def link
		load_unless_already_loaded(:xml)
		@data[:link]
	end



end