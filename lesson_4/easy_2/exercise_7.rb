# If we have a class such as the one below:

class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

# Explain what the @@cats_count variable does and how it works. 
# What code would you need to write to test your theory?

# The @@cats_count variable keeps track of the total number of Cat objects.  Every
# time a new Cat object is initialized, the class variable @@cats_count is incremented
# by 1.  The total number of cats can be found by calling the class method cats_count
# on the Cat class.

chloe = Cat.new("calico")
coco = Cat.new("calico")
tinkerbell = Cat.new("calico")

Cat.cats_count # => 3

12.times { Cat.new("hello") }

Cat.cats_count # => 15