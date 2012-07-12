# coding: utf-8
require_relative "../app/geocoding.rb"
require 'json'
describe "Geocoding"  do


	before(:each) do
		@loader = Geocoding.new("münster")
		@json_code_dummy = open('spec/lib/geocode.json'){ |f| f.read }
		@loader.stub!(:open){ @json_code_dummy }
		
	
	 end
	it "Should return a hash" do
		json_code_dummy = JSON.parse(@json_code_dummy)

		
		@loader.json_code=json_code_dummy
		loader= @loader.read_parameters
		loader= loader[:longitude]
		loader.should == 7.625538799999999
		#loader.should_not be_empty
	end

	it "Should return the longitude" do
		loader= @loader.longitude.to_s
		loader.should_not be_empty
	end


	it "Should return the latitude" do
		loader= @loader.latitude
		loader.should == 51.9514808
	end
	
	it "Should return the longitude" do
		loader= @loader.longitude
		loader.should == 7.625538799999999
	end

end