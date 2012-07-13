#encoding: utf-8
require 'rack'
require 'tilt'
require 'haml'
require 'json'
require File.expand_path("../config/render.rb", __FILE__)
#Start me with rackup config.ru
#config.ru


class Application 

	def self.render_url(location="index.haml",req=nil)
		@dir="view"
			template = Tilt.new("view/"+location)
			output=template.render(Application,:req=>req)
	end

	def self.run(env)


	#require File.expand_path('../view', __FILE__)
		
		req = Rack::Request.new(env)
			req =req.POST
		#if env["PATH_INFO"]=="/"
		if req["send"]!="Search..."
			output=render_url("index.haml")
			# 	template = Tilt.new(@dir+'index.haml')
			# output=template.render(nil,:req=>req)

		else
			#[env[:location]]
			output=render_url("result.haml",req)
		end
		[output]
	end
end
# Application.routes.draw do
  
#   get "view/index"
# end
run Proc.new {|env| [200, {"Content-Type" => "text/html"}, Application.run(env)]}