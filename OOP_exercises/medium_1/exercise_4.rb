require 'pry'

class Item
  attr_reader :value, :age

  def initialize(value, age)
    @value = value
    @age = age
  end
end

class CircularQueue
  def initialize(size)
    @queue = []
    @count = 1
    @max_size = size
  end

  def enqueue(value)
    delete_oldest_item if queue_full?
    add_item(value)
    increment_count
  end

  def dequeue
    return nil if queue_empty?
    value = oldest_item.value
    delete_oldest_item
    value
  end

  private
  
  def queue_empty?
    @queue.empty?
  end

  def queue_full?
    @queue.size == @max_size
  end

  def increment_count
    @count += 1
  end

  def add_item(value)
    @queue << Item.new(value, @count)
  end

  def oldest_item
    ages = @queue.map(&:age)
    oldest_age = ages.min
    @queue.select { |item| item.age == ages.min}.first
  end

  def delete_oldest_item
    @queue.delete(oldest_item)
  end
end

queue = CircularQueue.new(3)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue   == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil
