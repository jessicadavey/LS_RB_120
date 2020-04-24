class Television
  def self.manufacturer
    # method logic
    puts "Hello from manufacturer"
  end

  def model
    # method logic
    puts "Hello from model"
  end
end


# What would happen if I called the methods like shown below?

tv = Television.new

tv.manufacturer # => NoMethodError
tv.model # => outputs "Hello from model"

Television.manufacturer # => outputs "Hello from manufacturer"
Television.model # => NoMethodError