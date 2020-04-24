# Ben asked Alyssa to code review the following code:

class BankAccount
  attr_reader :balance

  def initialize(starting_balance)
    @balance = starting_balance
  end

  def positive_balance?
    balance >= 0
  end
end

# Alyssa glanced over the code quickly and said - "It looks fine, except that you 
# forgot to put the @ before balance when you refer to the balance instance variable 
# in the body of the positive_balance? method."

# "Not so fast", Ben replied. "What I'm doing here is valid - I'm not missing an @!"

# Who is right, Ben or Alyssa, and why?

# Ben - because there is a getter for the @balance variable (attr_reader), the 
# positive_balance? method can use a method named balance, rather than accessing
# the @balance variable directly.

wallet = BankAccount.new(100)

wallet.positive_balance? # => true