
require_relative './class_gather.rb'
require_relative '../concerns/cli_modules.rb'
require_relative './class_save.rb'
require 'pry'

class SolarVerde::CLI
include ::ConfirmAddress

attr_accessor :pos_address_string, :prediction, :location, :choice_code, :system_capacity, :azimuth, :tilt, :array_type, :module_type, :losses

def initialize
  @pos_address_string = ""
  call
end

# def pos_zip_string
#   @pos_address_string
# end

def call
  puts ""
  puts ""
                                                                        puts "                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
  puts "                     -------------------------------------"
  puts "                     Welcome To The Solar Output Estimator"
  puts "                     -------------------------------------"

puts "                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
  puts ""
  puts ""
  puts "                 An annual solar output estimate in kiloWattHours"
  puts "                           A/C for the continental U.S"
  puts ""
  puts ""
  get_location
  choices
end

def get_location
  puts ""
  puts "                  Please enter your address, street, city, state"
  puts "                  ----------------------------------------------"
  puts ""
  puts ""
  puts ""
  puts ""

  input = gets.strip
  @pos_address_string = input
   # found_record = Save.search_by_location(@pos_address_string)
   # puts "#{found_record}"
  #   if found_record != nil
  #     puts "record found"
  #     advanced_prediction(nil, nil, found_record)
  #   else
  #   @pos_address_string
  # end
  @pos_address_string
end

def choices
  puts ""
  puts "               -----------------------------------------------------------"
  puts "               Select an option below by entering the corresponding number"
  puts "               -----------------------------------------------------------"
  puts ""
  puts ""
  puts "              1. Simple yearly predicted output precentage based on a 4kW system"
  puts ""
  puts "              2. Advanced prediction, requires short guided questionnaire"
  puts ""
  puts "              3. Exit"
  puts ""

  response = nil
    response = gets.strip
    if response == "2" || response == "1"
      self.establish_confirm(response)
    elsif response == "3"
      puts ""
      puts ""
      puts "                     send feedback to : argus.two.2@gmail.com"
      puts ""
      puts ""
      puts ""
      puts ""
      exit(true)
    else
      puts ""
      puts "                      ---------------------------------"
      puts "                      Invalid choice, please try again."
      puts "                      ---------------------------------"
      puts ""
      get_location()
      choices()
    end
  end

def advanced_prediction(location=nil, choice_code=nil, outputs=nil)
  if outputs != nil
    puts ""
    puts "            Here is the predicted annual kWhac (kiloWattHours AC) for your system"
    puts ""
    puts "                              #{outputs} kWhac"
    puts "                                 ---------------"
    puts ""
    puts ""
    puts "                                  ..........."
    sleep(1)
    puts "                                  .  .   .  ."
    sleep(1)
    puts "                                  .    .    ."
    sleep(1)
    puts "                                  .  .....  ."
    sleep(1)
    puts "                                  ..........."
    puts ""
    puts "                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    puts ""
    puts ""
    puts "                          send feedback to : argus.two.2@gmail.com"
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    exit(true)
    SolarVerde::CLI.new.initialize
  end
  if choice_code == "1"
   outputs = AdvancedGather.simple(location)
   puts ""
   puts "            Here is the predicted annual kWhac (kiloWattHours AC) for your system"
   puts ""
   puts "                              #{outputs} kWhac"
   puts "                                 ---------------"
   puts ""
   puts ""
   puts "                                  ..........."
   sleep(1)
   puts "                                  .  .   .  ."
   sleep(1)
   puts "                                  .    .    ."
   sleep(1)
   puts "                                  .  .....  ."
   sleep(1)
   puts "                                  ..........."
   puts ""
   puts "                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
   puts ""
   puts ""
   puts "                       send feedback to : argus.two.2@gmail.com"
   puts ""
   puts ""
   puts ""
   puts ""
   puts ""
   puts ""
   puts ""
   puts ""
   puts ""
   exit(true) #comment out to save in memory
   SolarVerde::CLI.new.initialize
 elsif choice_code == "2"
   puts ""
   puts "            Please answer the following questions to the best of your ability."
   puts "            ------------------------------------------------------------------"
   puts ""
   puts "          The units will be described in the question. NUMBERS ONLY, 'h' for help. "
   puts "                   ::::::::::::::::::::::::::::::::::::::::::::::::::"
   puts ""
   puts ""
   system_capacity = capacity()
   azimuth = direction()
   tilt = til()
   array_type = type_arr()
   module_type = type_mod()
   losses = loss()

   outputs = AdvancedGather.complex(location, system_capacity, azimuth, tilt, array_type, module_type, losses)
   puts ""
   puts "                     Here is the predicted annual kWhac (kiloWattHours AC) for your system"
   puts ""
   puts "                                 #{outputs} kWhac"
   puts "                                   ---------------"
   puts ""
   puts ""
   puts "                     send feedback to : argus.two.2@gmail.com"
   puts ""
   puts ""
   puts ""
   puts ""
   # exit(true) #comment out to save.
   exit(true)
   SolarVerde::CLI.new.initialize
 end
end

 def capacity
   puts "               Please enter your system capacity in kW"
   puts ""
   puts ""
   s_capacity = gets.strip.downcase
   if s_capacity == 'h'
     help()
   end
   puts ""
   s_capacity
 end

 def direction
   puts "               Please enter the direction your array points towards"
   puts ""
   puts ""
   points_to = gets.strip.downcase
   if points_to == 'h'
     help()
   end
   points_to
 end

 def til
   puts ""
   puts "               Please enter the angle from the horizontal the array is positioned "
   puts ""
   puts ""
   s_tilt = gets.strip.downcase
   if s_tilt == 'h'
     help()
   end
   s_tilt
 end

 def type_arr
   puts ""
   puts "               Please enter your array-type, see help for more info"
   puts ""
   puts ""
   arr = gets.strip.downcase
   if arr == 'h'
     help()
   end
   arr
 end

 def type_mod
   puts ""
   puts "               Please enter your module type. (0)Standard, (1)Premium or (2)Thin Film"
   puts ""
   puts ""
   m_type = gets.strip.downcase
   if m_type == 'h'
     help()
   end
   m_type
 end

 def loss
   puts ""
   puts "                 Please enter your system losses"
   puts ""
   puts ""
   los = gets.strip.downcase
   if los == 'h'
     help()
   end
   puts "                 One moment please while we process your request"
   puts "                                  ..........."
   sleep(1)
   puts "                                  .  .   .  ."
   sleep(1)
   puts "                                  .    .    ."
   sleep(1)
   puts "                                  .  .....  ."
   sleep(1)
   puts "                                  ..........."

   puts ""
   puts "                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
   puts ""
   puts ""
   puts ""
   puts ""
   puts ""
   puts ""
   puts ""
   puts ""
   puts ""
   los
 end
end
