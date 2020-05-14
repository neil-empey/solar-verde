# require_relative './cli.rb'
require 'pry'
require 'opencage/geocoder'
#NREL api_key kPvYh2OjCIVqR4y0VLpZDKuJB1cM9u8CfdmbeeTk
#PVWatts request url GET /api/pvwatts/v6.format?parameters

class SolarVerde::Gather

  attr_accessor :address_string, :address_lat_long

  def initialize(address_string)
    @address_string = address_string
    @lat = nil
    @long = nil
    zip_to_latlong(address_string)
  end
  #zip to lat long (not a good name since any form of address or location is acceptbale)
  def zip_to_latlong(address)
    geocoder = OpenCage::Geocoder.new(api_key: '464d424f001944f28f7633d199bada6b')
    results = geocoder.geocode(address)
    results.first
    address_lat_long = results.first.coordinates
    @lat = address_lat_long[0]
    @long = address_lat_long[1]
    #create instances of lat/long for use below
  end

  def confirm_address
    confirm_array = []
    geocoder = OpenCage::Geocoder.new(api_key: '464d424f001944f28f7633d199bada6b')
    confirm = geocoder.reverse_geocode(@lat, @long)
    confirm_array << confirm
    confirm_array << [@lat, @long]
    confirm_array
  end


end
