# There are a number of variables listed below. 
# What are the different types and how do you know which is which?

excited_dog = "excited dog"
# local variable: lowercase letters, no @

@excited_dog = "excited dog"
# instance variable: starts with @ (assume initialized in an instance method)

@@excited_dog = "excited dog"
# class variable: starts with @@ (assume initialized at class level)