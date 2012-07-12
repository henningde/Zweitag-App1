# coding: utf-8
require_relative "../app/weather.rb"

describe "Weather"  do


	before(:each) do
		@loader = Weather.new("münster")
		@xml_code_dummy = open('spec/lib/weather.xml'){ |f| f.read }
		@loader.stub!(:open){ @xml_code_dummy }
		
	
	 end
	it "Should return a hash" do
		xml_code_dummy = Nokogiri::XML(@xml_code_dummy)
		xml_code_dummy.encoding = 'utf-8'
		xml_code_dummy.remove_namespaces!
		
		@loader.xml_code=xml_code_dummy
		loader= @loader.read_parameters
		loader= loader[:temp_c]
		loader.should == 14
		#loader.should_not be_empty
	end

	it "Should return the humidity" do
		loader= @loader.humidity.to_s
		loader.should_not be_empty
	end


	it "Should return the temperatur_tomorrow" do
		loader= @loader.temperatur_tomorrow
		loader.should == 14
	end
	
	it "Should return the humidity" do
		loader= @loader.humidity.to_s
		loader.should == "Luftfeuchtigkeit: 88 %"
	end

	it "Should return the condition" do
		loader= @loader.condition.to_s
		loader.should == "Meistens bewölkt"
	end

	it "Should return the temperatur" do
		loader= @loader.temperatur
		loader.should == 14
	end

	it "Should return the icon_today" do
		loader= @loader.condition.to_s
		loader.should_not be_empty
	end

	it "Should return the icon_tomorrow" do
		loader= @loader.condition.to_s
		loader.should_not be_empty
	end

end