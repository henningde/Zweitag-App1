# coding: utf-8
require_relative "../app/panoramio.rb"
require 'json'
describe "Panoramio"  do


	before(:each) do
		@loader = Panoramio.new("münster")
		@json_code_dummy = open('spec/lib/panorama.json'){ |f| f.read }
		@loader.stub!(:open){ @json_code_dummy }
		
	
	 end
	it "Should return a hash" do
		json_code_dummy = JSON.parse(@json_code_dummy)

		
		@loader.json_code=json_code_dummy
		loader= @loader.read_parameters
		loader= loader[:photo_file_url]
		loader.should == "http://mw2.google.com/mw-panoramio/photos/medium/522084.jpg"
		#loader.should_not be_empty
	end

	it "Should return the photo_url" do
		loader= @loader.photo_url.to_s
		loader.should_not be_empty
	end
	it "Should return the photo_url" do
		loader= @loader.photo_url
		loader.should == "http://www.panoramio.com/photo/522084"
	end

	it "Should return the photo_file_url" do
		loader= @loader.photo_file_url
		loader.should == "http://mw2.google.com/mw-panoramio/photos/medium/522084.jpg"
	end
	
	it "Should return the photo_title" do
		loader= @loader.photo_title
		loader.should == "In Memoriam Antoine de Saint-Exupéry"
	end

end