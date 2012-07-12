# coding: utf-8
require 'nokogiri'
require 'json'
require_relative 'geocoding.rb'
require_relative 'weather.rb'
require_relative 'panoramio.rb'
require_relative 'youtube.rb'
geocoding =  Geocoding.new("münster")

puts "Lng: #{geocoding.longitude}"
puts "Lat: #{geocoding.latitude}"



weather =  Weather.new("münster")

puts "Temp: #{weather.temperatur}"
puts "Temp tomorrow: #{weather.temperatur_tomorrow}"

panoramio =  Panoramio.new()

puts "Bild Title: #{panoramio.photo_title}"
puts "Bild Link: #{panoramio.photo_file_url}"
youtube =  YouTube.new("münster")

puts "Title: #{youtube.title}"

puts "Video Link: #{youtube.link}"
