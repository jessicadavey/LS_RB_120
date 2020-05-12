require 'pry'

class Minilang

  def initialize(string)
    @instructions = prepare(string)
    @stack = []
    @register = 0
  end

  def prepare(string)
    string.split.map do |str|
      if integer?(str)
        str.to_i
      else
        str.downcase.to_sym
      end
    end
  end

  def integer?(str)
    str.to_i.to_s == str
  end

  def print
    puts register
  end

  def push
    stack << register
  end

  def pop
    raise("Empty stack!") if stack.empty?
    self.register = stack.pop
  end

  def mult
    self.register = register * stack.pop
  end

  def add
    self.register = register + stack.pop
  end

  def div
    self.register = register / stack.pop
  end

  def mod
    self.register = register % stack.pop
  end

  def sub
    self.register = register - stack.pop
  end

  def invalid?(sym)
    ![:add, :sub, :div, :mod, :push, :pop, :mult, :print].include?(sym)
  end

  def eval
    begin
      instructions.each do |instruction|
        if instruction.class == Integer
          self.register = instruction
        elsif invalid?(instruction)
          raise("Invalid token: #{instruction.to_s.upcase}")
        else
          self.send(instruction)
        end
      end
    rescue RuntimeError => e
      puts e.message
    end
  end

  private

  attr_accessor :register, :stack
  attr_reader :instructions
end

Minilang.new('PRINT').eval
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5

Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)
