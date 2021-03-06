module Moveable
  attr_accessor :speed, :heading
  attr_writer :fuel_efficiency, :fuel_capacity
  
  def range
    @fuel_capacity * @fuel_efficiency
  end
end


class WheeledVehicle
  include Moveable

  def initialize(tire_array, km_traveled_per_liter, liters_of_fuel_capacity)
    @tires = tire_array
    self.fuel_efficiency = km_traveled_per_liter
    self.fuel_capacity = liters_of_fuel_capacity
  end

  def tire_pressure(tire_index)
    @tires[tire_index]
  end

  def inflate_tire(tire_index, pressure)
    @tires[tire_index] = pressure
  end


end

class Auto < WheeledVehicle
  def initialize
    # 4 tires are various tire pressures
    super([30,30,32,32], 50, 25.0)
  end
end

class Motorcycle < WheeledVehicle
  def initialize
    # 2 tires are various tire pressures
    super([20,20], 80, 8.0)
  end
end

class Seacraft
  attr_reader :propeller_count, :hull_count

  include Moveable
  
  def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
    # ... code omitted ...
    @num_propellers = num_propellers
    @num_hulls = num_hulls
    self.fuel_efficiency = km_traveled_per_liter
    self.fuel_capacity = liters_of_fuel_capacity
  end
  
  def range
    super + 10
  end
end

class Catamaran < Seacraft

end

class Motorboat < Seacraft
  def initialize(km_traveled_per_liter, liters_of_fuel_capacity)
    super(1, 1, km_traveled_per_liter, liters_of_fuel_capacity)
  end
end

boat1 = Motorboat.new(100, 5)
p boat1.range

boat2 = Catamaran.new(5, 2, 100, 5)
p boat2.range

p Auto.new.range
p Motorcycle.new.range