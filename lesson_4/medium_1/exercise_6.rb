# If we have these two methods:

class Computer
  attr_accessor :template

  def create_template
    @template = "template 14231" # accesses the instance variable directly, not using the setter
  end

  def show_template
    template # implicitly uses the getter method
  end
end

# and

class Computer
  attr_accessor :template

  def create_template
    self.template = "template 14231" # uses the setter method
  end

  def show_template
    self.template # uses the same getter method as the previous class
  end
end

# What is the difference in the way the code works?