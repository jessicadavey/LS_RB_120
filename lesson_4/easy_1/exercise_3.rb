# When we called the go_fast method from an instance of the Car class 
# you might have noticed that the string printed when we go fast includes 
# the name of the type of vehicle we are using. How is this done?


module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

# self.class returns the class of the object that called it.  If called by an 
# instance of the Car class, for example, it returns "Car".