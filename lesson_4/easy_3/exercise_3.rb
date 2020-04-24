# Given the class below, how do we create two different instances of this 
# class, both with separate names and ages?

class AngryCat
  def initialize(age, name)
    @age  = age
    @name = name
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hisssss!!!"
  end
end


# call AngryCat.new with 2 arguments, and save the object to a variable
# can do this as many times as you want
cat1 = AngryCat.new(3, "ginger")
cat2 = AngryCat.new(4, "luke")

cat1.age
cat1.name

cat2.age
cat2.name