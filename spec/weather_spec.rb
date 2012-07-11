# coding: utf-8
require_relative "../app/weather.rb"

describe "Weather"  do
	it "Should return empty" do
		lambda{Weather.new("berlin","asd")}.should
		raise_error(Weather::ParseNokogiriError, "Could not find an XML File")
	end

	it "Should return a file" do
		loader = Weather.new("berlin").to_s
		loader.should_not be_empty
	end

	it "Should return a file with umlauts" do
		loader = Weather.new("münster").to_s
		loader.should_not be_empty
	end

	it "Should return the temperatur" do
		loader = Weather.new("münster")
		loader= loader.temperatur.to_s
		loader.should_not be_empty
	end

		it "Should return the humidity" do
		loader = Weather.new("münster")
		loader= loader.humidity.to_s
		loader.should_not be_empty
	end

end