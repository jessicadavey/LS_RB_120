# How do you find where Ruby will look for a method when that method is called? 
# How can you find an object's ancestors?

module Taste
  def flavor(flavor)
    puts "#{flavor}"
  end
end

class Orange
  include Taste
end

class HotSauce
  include Taste
end

# call .ancestors on the class that the object is an instance of
# object.class.ancestors

orange = Orange.new
orange.class.ancestors # => [Orange, Taste, Object, Kernel, BasicObject]

HotSauce.ancestors # => [HotSauce, Taste, Object, Kernel, BasicObject]