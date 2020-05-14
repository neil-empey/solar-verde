module ConfirmAddress
  def establish_confirm(choice)
    puts ""
    puts "                   processing your request, one moment please..."
    puts "                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    puts ""
    puts ""
    puts ""
    process1 = SolarVerde::Gather.new(@pos_address_string)
    check = process1.confirm_address[0]
    check2 = process1.confirm_address[1]
    check.address
    puts "                Confirm the address is correct : --->  #{check.address}"
    puts "                --------------------------------"
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
        advanced_prediction(check2, choice)
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
