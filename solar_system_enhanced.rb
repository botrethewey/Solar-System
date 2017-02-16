#this is for git excercise!!!!!!! added a comment to make a change on rb file.



#declares the Planet Class
class Planet
  #attribute readers
  attr_reader :name, :distance_from_the_sun,:rate_of_solar_rotation, :orbital_period

  #constructor method for a Planet object
  def initialize(planet_hash)
    @name = planet_hash[:name]
    @mass = planet_hash[:mass] #unit: (e+24 kg)
    @diameter =  planet_hash[:diameter] #unit: (km)
    @number_of_moons =  planet_hash[:number_of_moons]
    @distance_from_the_sun =  planet_hash[:distance_from_the_sun] #unit: (e+6 km)
    @rate_of_solar_rotation =  planet_hash[:rate_of_solar_rotation] #unit: (length of one day in hours)
    @orbital_period =  planet_hash[:orbital_period] #unit : (length of year in earth days)
  end

  #method that prints planet data
  def print_info
    puts "                      Planet Summary"
    puts "============================================================="
    puts "Planet Name: #{@name.capitalize}"
    puts "Mass: #{@mass} e+24 kg"
    puts "Diameter: #{@diameter} km"
    puts "Number of Moons: #{@number_of_moons}"
    puts "Average Distance From The Sun: #{@distance_from_the_sun} e+6 km"
    puts "Rate of Solar Rotation: #{@rate_of_solar_rotation} hours"
    puts "Orbital Period: #{@orbital_period} Earth days\n\n"
  end

  #method that calculates the distance between two planets
  def distance_between(planet_other)
    return (@distance_from_the_sun - planet_other.distance_from_the_sun).abs.round(2)
  end
end

#declares the SolarSystem
class SolarSystem
  #attribute accessor
  attr_accessor :planets
  #attribute reader
  attr_reader :formation_year

  #constructor method for a SolarSystem object
  def initialize(formation_year)
    @formation_year = formation_year
    @planets = []
  end

  #method that adds a single Planet object to the SolarSystem
  def add_planet(planet)
    @planets.push(planet)
  end

  #method that adds an array of Planet objects to the SolarSystem
  def add_planets(planets)
    planets.each do |planet|
      @planets.push(planet)
    end
  end

  #method that calculates the local year of a planet
  def local_year(planet)
    (@formation_year / planet.orbital_period).round(2)
  end
end

#array that stores several Planet objects
planets = [
  Planet.new(
    {
      name: "mercury",
      mass: 0.33,
      diameter: 4879.4,
      number_of_moons: 0,
      distance_from_the_sun: 57.9,
      rate_of_solar_rotation: 1407.6,
      orbital_period: 87.97
    }
  ),
  Planet.new(
    {
      name: "venus",
      mass: 4.87,
      diameter: 12104,
      number_of_moons: 0,
      distance_from_the_sun: 108.2,
      rate_of_solar_rotation: 5832.5,
      orbital_period: 224.7
      }
    ),
  Planet.new(
    {
      name: "earth",
      mass: 5.98,
      diameter: 12756,
      number_of_moons: 1,
      distance_from_the_sun: 149.6,
      rate_of_solar_rotation: 23.93,
      orbital_period: 365.2
    }
  ),
  Planet.new(
    {
      name: "mars",
      mass: 0.642,
      diameter: 6792,
      number_of_moons: 2,
      distance_from_the_sun: 227.9,
      rate_of_solar_rotation: 24.6,
      orbital_period: 687
    }
  ),
  Planet.new(
    {
      name: "jupiter",
      mass: 1898,
      diameter: 142984,
      number_of_moons: 67,
      distance_from_the_sun: 778.6,
      rate_of_solar_rotation: 9.9,
      orbital_period: 4331
    }
  ),
  Planet.new(
    {
      name: "saturn",
      mass: 568,
      diameter: 120536,
      number_of_moons: 62,
      distance_from_the_sun: 1433.5,
      rate_of_solar_rotation: 10.7,
      orbital_period: 10747
    }
  ),
  Planet.new(
    {
      name: "uranus",
      mass: 86.8,
      diameter: 51118,
      number_of_moons: 27,
      distance_from_the_sun: 2872.5,
      rate_of_solar_rotation: 17.2,
      orbital_period: 30589
    }
  ),
  Planet.new(
    {
      name: "neptune",
      mass: 102,
      diameter: 49528,
      number_of_moons: 14,
      distance_from_the_sun: 4495.1,
      rate_of_solar_rotation: 16.1,
      orbital_period: 59800
    }
  )
]

#create new SolarSystem object and store it to the variable, sol
sol = SolarSystem.new(4600000000)

#adds an array of Planet objects to sol
sol.add_planets(planets)

#method that ensures that user input for the planet name is valid
def valid_name(input)
  while true
    if input =~ /^(\w){2,}$/
      return input.downcase
    else
      puts "Try again! Only use letters, numbers, or underscore"
      input = gets.chomp
    end
  end
end

#method that ensures that user input for the planet data is a valid float value
def valid_float(input)
  while true
    if input =~ /^(\d)*(.)?(\d)+$/ && input.to_f > 0
      return input.to_f
    else
      puts "Try again! Only use numbers"
      input = gets.chomp
    end
  end
end

#method that ensures that user input for the planet data is a valid integer value
def valid_integer(input)
  while true
    if input =~ /^(\d)+$/  && input.to_i > 0
      return input.to_i
    else
      puts "Try again! Only use numbers"
      input = gets.chomp
    end
  end
end

#method that handles manual addition of a new planet to the SolarSystem object
def manual_add_planet(sol)
  puts "What is the name of the planet? "
  name = valid_name(gets.chomp)
  puts "What is the mass(unit: 1e+24 kg) of the planet #{name}?"
  mass = valid_float(gets.chomp)
  puts "What is the diameter(unit: km) of the planet #{name}?"
  diameter = valid_float(gets.chomp).abs
  puts "How many moons does the planet #{name} have?"
  number_of_moons = valid_integer(gets.chomp)
  puts "What is the distance(unit: 1e+6 km) between the sun and the planet #{name}?"
  distance_from_the_sun = valid_float(gets.chomp).abs
  puts "What is the rate of the solar rotation for the planet #{name} in Earth hours?"
  rate_of_solar_rotation = valid_float(gets.chomp)
  puts "What is the orbital period for the planet #{name} in Earth days?"
  orbital_period = valid_float(gets.chomp)

  sol.add_planet(
    Planet.new(
      {
        name: name,
        mass: mass,
        diameter: diameter,
        number_of_moons: number_of_moons,
        distance_from_the_sun: distance_from_the_sun,
        rate_of_solar_rotation: rate_of_solar_rotation,
        orbital_period: orbital_period
      }
    )
  )
  return sol
end

def additional_option(planet_chosen, sol)
  puts "                      Additional Data"
  puts "============================================================="
  puts "Planet Local Year: #{sol.local_year(planet_chosen)} years"
  puts "\nRelative Distance to Other Planets Within the Solar System:"
  sol.planets.each do |planet|
    if planet_chosen != planet
    puts "#{planet.name.capitalize}: #{planet_chosen.distance_between(planet)}(unit: 1e+6 km)"
    end
  end
end


def run_program(sol)
  puts "\nPlease select the planet you'd like to learn about from the following choices!"
  puts "(Hint: enter '1' for Mercury, or '2' for Venus, and so on)"
  #ensures that user input for the operation is valid
  while true
    print "Your Choice: "
    user_choice = gets.chomp.to_i
    if (1..sol.planets.length).include?(user_choice)
      break
    else
      puts "Try again! Please enter a valid number from the list of planets!"
    end
  end
  planet_chosen = sol.planets[user_choice - 1]
  (planet_chosen).print_info
  additional_option(planet_chosen, sol)
end


#entry point of the program
title = "╔═╗┌─┐┬  ┌─┐┬─┐  ╔═╗┬ ┬┌─┐┌┬┐┌─┐┌┬┐  ╔═╗─┐ ┬┌─┐┬  ┌─┐┬─┐┌─┐┬─┐
╚═╗│ ││  ├─┤├┬┘  ╚═╗└┬┘└─┐ │ ├┤ │││  ║╣ ┌┴┬┘├─┘│  │ │├┬┘├┤ ├┬┘
╚═╝└─┘┴─┘┴ ┴┴└─  ╚═╝ ┴ └─┘ ┴ └─┘┴ ┴  ╚═╝┴ └─┴  ┴─┘└─┘┴└─└─┘┴└─
"
puts "\n#{title}"
puts "Welcome to my Solar System Explorer program!"

#prints the current list of planets within the SolarSystem object
puts "\nCurrently there are #{sol.planets.length} planets in this solar system."
sol.planets.each_with_index { |planet, index| puts "#{index + 1}. #{planet.name.capitalize}" }

#gives user an option to add more planets to the SolarSystem object
while true
  puts "\nWould you like to add a new planet? (yes/no)"
  print "Your Answer: "
  user_answer = gets.chomp.downcase
  if user_answer == "yes"
    sol = manual_add_planet(sol)
    puts "#{sol.planets[-1].name.capitalize} has been added to the solar system!"
    puts "\nCurrently there are #{sol.planets.length} planets in this solar system."
    sol.planets.each_with_index { |planet, index| puts "#{index + 1}. #{planet.name.capitalize}" }
  elsif user_answer == "no"
    break
  else
    puts "Try again! Please enter 'yes' or 'no'"
  end
end

#initial run of the program
run_program(sol)

#gives user an option to choose another planet
while true
  puts "\nWould you like to learn about another planet? (yes/no)"
  print "Your Answer: "
  user_answer = gets.chomp
  if user_answer == "yes"
    run_program(sol)
  elsif user_answer == "no"
    puts "\nThank you for using my Solar System Explorer program!!\n\n"
    break
  else
    puts "Try again! Please enter 'yes' or 'no'"
  end
end
