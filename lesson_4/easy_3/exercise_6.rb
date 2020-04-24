# In the make_one_year_older method we have used self. 
# What is another way we could write this method so we don't have to use the 
# self prefix?

class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    # self.age += 1 
    @age += 1 # could access the @age variable directly
  end
end


chloe = Cat.new("good")
chloe.make_one_year_older

p chloe.age