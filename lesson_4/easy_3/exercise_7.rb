# What is used in this class but doesn't add any value?

class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.information
    return "I want to turn on the light with a brightness level of super high and a color of green"
  end

end

# There is no need for the attr_accessor here because getters and setters are now
# used in any instance methods. (could be used later or by another method perhaps?)

# The return in the self.information method, because the last line is returned anyway.