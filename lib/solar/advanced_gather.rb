require_relative './cli.rb'
require 'httparty'

class AdvancedGather
  include HTTParty
  format :json

  attr_accessor :location, :choice_code, :locate

  @@all = []

  def self.all
    @@all
  end

  def self.grab(locate, system_capacity=4, azimuth=180, tilt=30.26, array_type=1, module_type=0, losses=14)
  #SEE NOTES BELOW ON DEFAULTED VALUES
      response = HTTParty.get("https://developer.nrel.gov/api/pvwatts/v6.json?api_key=kPvYh2OjCIVqR4y0VLpZDKuJB1cM9u8CfdmbeeTk&lat=#{locate[0]}&lon=#{locate[1]}&system_capacity=#{system_capacity}&azimuth=#{azimuth}&tilt=#{tilt}&array_type=#{array_type}&module_type=#{module_type}&losses=#{losses}")
  end

  def self.simple(locate)
    @locate = locate
    result = grab(locate)
    @@all << result
    return result["outputs"]["ac_annual"]
  end

  def self.complex(locate, system_capacity, azimuth, tilt, array_type, module_type, losses)
    @locate = locate
    result = grab(locate, system_capacity=4, azimuth=180, tilt=30.26, array_type=1, module_type=0, losses=14)
    @@all << result
    return result["outputs"]["ac_annual"]
  end
end
  #DEFAULTED VALUES IN PREDICTION MODEL
  #azimuth will be set @ default of 180 degrees(south)
  #system_capicity will be set @ 4kW
  #tilt will be defaulted @ 30.26 degrees (roof pitch)
  #array type will be defaulted @ 1 (roof mounted)
  #module type will be defaulted @ 0 (standard)
  #system loses defaulted to 14%
