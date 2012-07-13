# coding: utf-8
require_relative "../app/youtube.rb"
require 'nokogiri'
describe "YouTube"  do


	before(:each) do
		@loader = YouTube.new("münster")
		@xml_code_dummy = open('spec/lib/youtube.xml'){ |f| f.read }
		@loader.stub!(:open){ @xml_code_dummy }
		
	
	 end
	it "Should return a hash" do
		xml_code_dummy = Nokogiri::XML(@xml_code_dummy)
		xml_code_dummy.encoding = 'utf-8'
		xml_code_dummy.remove_namespaces!
		
		@loader.xml_code=xml_code_dummy
		loader= @loader.read_parameters
		loader= loader[:video_id]
		loader.should == "http://gdata.youtube.com/feeds/api/videos/e-a-jyahRL8"
		#loader.should_not be_empty
	end

	it "Should return the title" do
		loader= @loader.title.to_s
		loader.should_not be_empty
	end


	it "Should return the title" do
		loader= @loader.title
		loader.should == "Soulman Seether - Mein Münster (Official Video)"
	end
	
	it "Should return the link" do
		loader= @loader.link.to_s
		loader.should == "https://www.youtube.com/v/e-a-jyahRL8?version=3&f=videos&app=youtube_gdata"
	end

	it "Should return the video_id" do
		loader= @loader.video_id.to_s
		loader.should == "http://gdata.youtube.com/feeds/api/videos/e-a-jyahRL8"
	end

end