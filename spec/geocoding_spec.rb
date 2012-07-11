# coding: utf-8
require_relative "../app/geocoding.rb"


describe "Geocoding"  do
	it "Should return empty" do
		lambda{Geocoding.new("berlin")}.should
		raise_error(Geocoding::LoadConnectionError, "Could not find an XML File")
	end

	it "Should return a file" do
		loader = Geocoding.new("berlin").to_s
		loader.should_not be_empty
	end

	it "Should return the longitude " do
		loader = Geocoding.new("münster")
		loader= loader.longitude.to_s
		loader.should_not be_empty
	end

		it "Should return the longitude" do
		loader = Geocoding.new("münster")
		loader= loader.longitude.to_s
		loader.should_not be_empty
	end

		it "Should return the latitude" do
		loader = Geocoding.new("münster")
		loader= loader.latitude.to_s
		loader.should_not be_empty
	end

end
