# 1. Given the below usage of the Person class, code the class definition.

# Answer:
# class Person
#   attr_accessor :name
#   def initialize(name)
#     @name = name
#   end
# end

# 2. Modify the class definition from above to facilitate the following methods. Note that there is no name= setter method now.

# Answer:
# class Person
#   attr_accessor :last_name, :first_name
  
#   def initialize(name)
#     @first_name = name
#     @last_name = ""
#   end
  
#   def name
#     "#{@first_name} #{@last_name}".strip
#   end
  
# end


# 3. Now create a smart name= method that can take just a first name or a full name, and knows how to set the first_name and last_name appropriately.
# Answer:
class Person
  attr_accessor :first_name, :last_name
  
  def initialize(name)
    split_name(name)
  end
  
  def name
    @last_name.empty? ? first_name : "#{first_name} #{last_name}"
  end
  
  def name=(name)
    split_name(name)
  end

  def to_s
    name
  end
  
  private
  
  def split_name(full_name)
    full_name = full_name.split
    @first_name = full_name[0]
    @last_name = full_name[1] || ""
  end

end


# 4. Using the class definition from step #3, let's create a few more people -- that is, Person objects.
# If we're trying to determine whether the two objects contain the same name, 
# how can we compare the two objects?
bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')

# Answer:
p bob.name == rob.name

# 5. Continuing with our Person class definition, what does the below print out?

bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}"

# Answer:
# It will print out the (complicated!) name of the object, like this:
# #<Person:0x0000560dc6ddfef8>

# Let's add a to_s method to the class (see above):
# Now, what does the below output?

bob = Person.new("Robert Smith")
puts "The person's name is: #{bob}"

# Answer:
# The person's name is Robert Smith.