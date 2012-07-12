# coding: utf-8
require_relative "../app/api_module.rb"
require 'nokogiri'
require 'json'
##ist das ok???


describe "API_Module"  do
	

	class DummyClass
		include ApiModule
	end
	before(:each) do
		@dummy = DummyClass.new
		@xml_code = open('spec/lib/weather.xml'){ |f| f.read }
		@json_code = open('spec/lib/panorama.json'){ |f| f.read }
	 end

	it "Should return API Content" do
		@dummy.url="http://www.google.com/ig/api?weather=berlin&hl=de"
		content= @dummy.load_data
		content.should_not be_empty
	end

	it "Should return a file with umlauts" do
		@dummy.url="http://www.google.com/ig/api?weather=münster&hl=de"
		content= @dummy.load_data
		content.should_not be_empty
	end

	it "Should return empty. Could not find a API" do
		@dummy.url="hgfh"
		lambda{@dummy.load_data}.should
		raise_error(DummyClass::LoadConnectionError, "Could not reach the API.")
	end

	it "Should return JSON Code" do
		@dummy.stub!(:open){ @json_code }
		@dummy.url= "http://www.panoramio.com/map/get_panoramas.php?set=public&from=0&to=20&minx=-180&miny=-90&maxx=180&maxy=90&size=medium&mapfilter=true"
		@dummy.load_data
		content = @dummy.parse_json
		content= content["photos"].first["photo_id"]
		content.should == 522084
	end


	it "Should return XML Code" do
		@dummy.url= ""
		@dummy.stub!(:open).and_return(@xml_code)
		@dummy.load_data
		content = @dummy.parse_xml
		content= content.xpath("//xml_api_reply/weather/current_conditions/temp_c/@data").first
		content = content.value
		content.should == "14"
	end
end


