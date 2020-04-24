class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

# What happens in each of the following cases:

# case 1:

hello = Hello.new
hello.hi # output "Hello"

# case 2:

hello = Hello.new
hello.bye # NoMethodError -> bye is not avaiable to objects of Hello class

# case 3:

hello = Hello.new
hello.greet # ArgumentError -> greet expects 1 argument, given 0

# case 4:

hello = Hello.new
hello.greet("Goodbye") # -> "Goodbye" is output

# case 5:

Hello.hi # -> NoMethodError -> hi is not available to the Hello class, only 
# instances of the class