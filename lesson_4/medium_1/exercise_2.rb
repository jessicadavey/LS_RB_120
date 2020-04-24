class InvoiceEntry
  attr_reader :quantity, :product_name
  attr_writer :quantity

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    # prevent negative quantities from being set
    self.quantity = updated_count if updated_count >= 0
  end
end

# Alyssa looked at the code and spotted a mistake. 
# "This will fail when update_quantity is called", she says.

# Can you spot the mistake and how to address it?

# Line 11 is creating a new local variable quantity, rather than accessing the
# quantity variable.

# Either change to @quantity, or (preferred) add a setter method for quantity
# and then call self.quantity.

test = InvoiceEntry.new("cheese", 5)
test.update_quantity(6)
p test.quantity