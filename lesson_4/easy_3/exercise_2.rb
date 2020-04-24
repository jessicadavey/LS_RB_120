# If we call Hello.hi we get an error message. How would you fix this?

class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
  
  def self.hi # define a class method hi (but don't call greet instance method)
    puts "Hello from Hello class"
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end


Hello.hi
