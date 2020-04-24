# If I have the following class:

class Television
  def self.manufacturer
    # method logic
    puts "hello from manufacturer"
  end

  def model
    # method logic
  end
end


# Which one of these is a class method (if any) 
# and how do you know? How would you call a class method?

# self.manufacturer is a class method
# it is prefixed with self, which in this context references the class itself
# call it directly on the class

Television.manufacturer