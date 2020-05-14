require_relative './cli.rb'


class Save

  attr_accessor :location, :output

  @@all = []

  def initialize(location, output)
    @location = location
    @output = output
    @@all << [@location, @output]
    puts "saved"
  end

  def self.all
    @@all
  end

  def self.search_by_location(place)
    return nil if self.all.empty?
   self.all.each_with_index do |ele, i|
      if ele[0][0] == place[0] && ele[0][1] == place[1]
        return ele[1]
      else
        return nil
      end
    end
  end

    end
