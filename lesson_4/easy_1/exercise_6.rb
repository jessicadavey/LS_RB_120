# What could we add to the class below to access the instance variable @volume?

class Cube
  def initialize(volume)
    @volume = volume
  end
  
  def get_volume
    @volume
  end
end

# if we just want to read the variable, 
# attr_reader :volume
# or
# def volume
#  @volume
# end

# also call instance_variable_get

cube = Cube.new(30)

# p cube.instance_variable_get("@volume")

# p cube.volume

p cube.get_volume