# Which of these two classes has an instance variable and how do you know?

class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end

# Pizza, because there is a variable name that starts with @.


# Can also call the method instance_variables on an instance of the class.


banana = Fruit.new("banana")
margherita = Pizza.new("cheese")

p banana.instance_variables # => []
p margherita.instance_variables # => [:@name]