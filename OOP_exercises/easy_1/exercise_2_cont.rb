class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    @name.upcase!
    "My name is #{@name}."
  end
end

name = 42
fluffy = Pet.new(name)
name += 1
puts fluffy.name  # "42" Not 43 because local variable name was 42 when object was initialized.  Then local varialbe name was reassigned.
puts fluffy # My name is 42.  Works because integer is converted to string
puts fluffy.name # "42"
puts name # 43 Local variable name was reassigned to 43 on line 16