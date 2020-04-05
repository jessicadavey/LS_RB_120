# Modify the following code so that Hello! I'm a cat! is printed when Cat.generic_greeting is invoked.

class Cat
  def self.generic_greeting
    puts "Hello! I'm a cat!"
  end
end

Cat.generic_greeting

# What happens if you run kitty.class.generic_greeting? Can you explain this result?

kitty = Cat.new
kitty.class.generic_greeting

# kitty.class refers to the class 'Cat', so it's the same result as Cat.generic_greeting.

