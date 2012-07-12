# coding: utf-8
require_relative 'api_module.rb'
require 'nokogiri'
require 'json'

class DummyClass
		include ApiModule


	def initialize(location)
	 	@url = url
		@location= location
		@url= "http://www.panoramio.com/map/get_panoramas.php?set=public&from=0&to=20&minx=-180&miny=-90&maxx=180&maxy=90&size=medium&mapfilter=true"
	#	@doc ='<?xml version="1.0"?><xml_api_reply version="1"><weather module_id="0" tab_id="0" mobile_row="0" mobile_zipped="1" row="0" section="0" ><forecast_information><city data="M�nster, North Rhine-Westphalia"/><postal_code data="m�nster"/><latitude_e6 data=""/><longitude_e6 data=""/><forecast_date data="2012-07-12"/><current_date_time data="1970-01-01 00:00:00 +0000"/><unit_system data="SI"/></forecast_information><current_conditions><condition data="Regen"/><temp_f data="55"/><temp_c data="13"/><humidity data="Luftfeuchtigkeit: 86�%"/><icon data="/ig/images/weather/rain.gif"/><wind_condition data="Wind: SW mit 11 km/h"/></current_conditions><forecast_conditions><day_of_week data="Do."/><low data="13"/><high data="19"/><icon data="/ig/images/weather/chance_of_storm.gif"/><condition data="Vereinzelt st�rmisch"/></forecast_conditions><forecast_conditions><day_of_week data="Fr."/><low data="12"/><high data="16"/><icon data="/ig/images/weather/rain.gif"/><condition data="Regen"/></forecast_conditions><forecast_conditions><day_of_week data="Sa."/><low data="13"/><high data="18"/><icon data="/ig/images/weather/chance_of_storm.gif"/><condition data="Vereinzelt st�rmisch"/></forecast_conditions><forecast_conditions><day_of_week data="So."/><low data="10"/><high data="18"/><icon data="/ig/images/weather/chance_of_rain.gif"/><condition data="Vereinzelt Regen"/></forecast_conditions></weather></xml_api_reply>'
	@uprl= "http://www.google.com/ig/api?weather=münster&hl=de"
	end

end

geocoding =  DummyClass.new("münster")
# geocoding.load_data
# geocoding=geocoding.parse_xml
# puts geocoding

#@dummy.url= "http://www.panoramio.com/map/get_panoramas.php?set=public&from=0&to=20&minx=-180&miny=-90&maxx=180&maxy=90&size=medium&mapfilter=true"
	geocoding.load_data

 content =geocoding.parse_json
 puts content["photos"].first["photo_id"]


