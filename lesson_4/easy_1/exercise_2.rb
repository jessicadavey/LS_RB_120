# If we have a Car class and a Truck class and we want to be able to go_fast, 
# how can we add the ability for them to go_fast using the module Speed? 
# How can you check if your Car or Truck can now go fast?

module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed
  
  def go_slow
    puts "I am safe and driving slow."
  end
end

class Truck
  include Speed
  
  def go_very_slow
    puts "I am a heavy truck and like going very slow."
  end
end

# Answer: include the Speed module in the class definition, and call go_fast
# on an instance of the class.

Car.new.go_fast
Truck.new.go_fast

# can also call ancestors on the class to see if Speed is in the lookup chain:

p Car.ancestors
p Truck.ancestors