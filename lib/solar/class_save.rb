require 'pry'
class Save

  attr_accessor :location, :output

  @@all = []

  def initialize(location, output)
    @location = location
    @output = output
    @@all << [@location, @output] #could have used self
  end

  def self.top_ish #top_five sorts by kWhac smallest first
    return 0 if self.all.empty?
    top_five = self.all.sort_by {|ele| ele[1]}
    (0...self.all.length).each do |i|
      puts "#{i + 1}.  #{SolarVerde::Gather.get_confirm(top_five.reverse[i][0]).address}"
    end
  end

  def self.all
    @@all
  end
  #checking to see if any lat/long exists in the @@all
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
