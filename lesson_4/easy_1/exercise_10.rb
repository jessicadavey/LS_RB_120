# If we have the class below, what would you need to call to create a new instance 
# of this class.

class Bag
  def initialize(color, material)
    @color = color
    @material = material
  end
end

handbag = Bag.new("blue", "canvas") # need to call .new on the class Bag and pass
# in 2 arguments

p handbag