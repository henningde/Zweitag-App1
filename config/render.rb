
class RenderURL

	def initialize(url="index.haml",req=nil)
		@dir="view/"
			template = Tilt.new(@dir+"index.haml")
			output=template.render(nil,:req=>req)
	end
end