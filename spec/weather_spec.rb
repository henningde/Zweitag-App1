# coding: utf-8
require_relative "../app/weather.rb"

describe "Weather"  do
	it "Should return empty" do
		loader = Weather.new("berlin","asd")
		loader = loader.loadXML
		loader.should be_empty
	end


	it "Should return a file" do
		loader = Weather.new("berlin")
		loader = loader.loadXML.to_s
		loader.should_not be_empty
	end

		it "Should return a file with umlauts" do
		loader = Weather.new("münster")
		loader = loader.loadXML.to_s
		loader.should_not be_empty
	end

end