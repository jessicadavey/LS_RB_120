# If we have a class such as the one below:

class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    self.age += 1
  end
end

# You can see in the make_one_year_older method we have used self. 
# What does self refer to here?

# here self will refer to the instance of the object that calls the method.

chloe = Cat.new("calico")

chloe.make_one_year_older # self will refer to chloe

p chloe.age # => 1