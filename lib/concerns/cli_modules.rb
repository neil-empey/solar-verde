module ConfirmAddress
  def establish_confirm(choice)
    puts ""
    puts "                   processing your request, one moment please..."
    puts "                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    puts ""
    puts ""
    puts ""
    #we turn mailing address into lat/long then reverse the process to get a mailing address and confirm that this is their address. Helps in location precision.
    process1 = SolarVerde::Gather.new(@pos_address_string)
    check = process1.confirm_address[0] #normal mailing address
    check2 = process1.confirm_address[1]#lat long
    check.address
    puts  "        Confirm the address : --->  #{check.address}"
    puts "        -------------------"
    puts ""
    puts "                        Please enter (Y) or (N)"
    puts ""
    puts ""
    puts ""
    puts ""
      confirmation = gets.strip.downcase
      case confirmation
      when "y"
        puts ""
        #searching to see if lat/long in Save @@all
        found_record = Save.search_by_location(check2)
          if found_record == nil
              advanced_prediction(check2, choice, nil)
            else
            advanced_prediction(nil, nil, found_record)
      end
      when "n"
        puts ""
        puts "                               ---------------------"
        puts "                               Let's try this again."
        puts "                               ---------------------"
        puts ""
        get_location()
        choices()
      end
    end
    #help menu for option 2 main menu
    def help
      puts "   The average system capacity in the U.S is 4kW or 4000W"
      puts ""
      puts "   Azimuth values in degrees, i.e 180 being south"
      puts ""
      puts "   Tilt is the angle from the horizontal of your array. This programs default is 30.26. If mounted on your roof, its the roof pitch"
      puts ""
      puts "   Array Type values here are as follows"
      puts ""
      puts "     0. Fixed open rack"
      puts "     1. Fixed roof mount"
      puts "     2. 1-axis"
      puts "     3. 1-axis backtracking"
      puts "     4. 2-axis"
      puts ""
      puts "   Module Type assigns values as follows"
      puts ""
      puts "     0.	Standard   ~15% efficiency"
      puts "     1.	Premium    ~19% efficiency"
      puts "     2.	Thin film  ~10% efficiency"
      puts ""
      puts "   Losses can be difficult assess. On average most systems can be said to have around 14% loss"
      puts ""
      puts ""
      puts "For further reading"
      puts "NREL National Renewable Energy Laboratory"
      puts "September 2004 PVWatts Version 5 Manual"
      puts " Aron P. Dobos"
      puts "www.nrel.gov/publications."
      puts ""
      puts ""
    end
  end
