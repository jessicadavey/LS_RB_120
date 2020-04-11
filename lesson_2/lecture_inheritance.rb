# 1. Given this class, create a sub-class from Dog called Bulldog 
# overriding the swim method to return "can't swim!"

# class Dog
#   def speak
#     'bark!'
#   end

#   def swim
#     'swimming!'
#   end
# end

# class Bulldog < Dog

#   def swim
#     "can't swim!"
#   end
# end

# 2. Create a new class called Cat, which can do everything a dog can, except swim or fetch. 
# Assume the methods do the exact same thing. 

class Pet
  def speak
    'hello!'
  end

  def run
    'running!'
  end

  def jump
    'jumping!'
  end
end

class Dog < Pet
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end

  def fetch
    'fetching!'
  end
end

class Cat < Pet
  def speak
    'meow!'
  end
end

chloe = Cat.new
puts chloe.speak
puts chloe.run
puts chloe.jump