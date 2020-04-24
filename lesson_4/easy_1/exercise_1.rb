# Which of the following are objects in Ruby? If they are objects, 
# how can you find out what class they belong to?


# All are objects, and using Object#class returns the class type.

p true.class # TrueClass
p "hello".class # String
p [1, 2, 3, "happy days"].class # Array
p 142.class # Integer