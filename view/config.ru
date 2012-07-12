#encoding: utf-8
require 'rack'
require 'tilt'
require 'haml'
require 'json'
#Start me with rackup config.ru
#config.ru

class Application
	def self.run(env)
		
		if env["PATH_INFO"]=="/"
			template = Tilt.new('index.haml')
			output=template.render
		else
			#[env[:location]]
			req = Rack::Request.new(env)
			req =req.POST
			template = Tilt.new('result.haml')
			output=template.render(nil,:req=>req)
		end
		[output]
	end
end

run Proc.new {|env| [200, {"Content-Type" => "text/html"}, Application.run(env)]}

