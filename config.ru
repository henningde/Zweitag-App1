#encoding: utf-8
require 'rack'
require 'tilt'
require 'haml'
require 'json'
require 'rails/all'

#Start me with rackup config.ru
#config.ru

class Application 

	def self.run(env)
	#require File.expand_path('../view', __FILE__)
		
		req = Rack::Request.new(env)
			req =req.POST
		#if env["PATH_INFO"]=="/"
		if req["send"]!="Search..."

			template = Tilt.new('index.haml')
			output=template.render
		else
			#[env[:location]]
			
			template = Tilt.new('result.haml')
			output=template.render(nil,:req=>req)
		end
		[output]
	end
end

run Proc.new {|env| [200, {"Content-Type" => "text/html"}, Application.run(env)]}

