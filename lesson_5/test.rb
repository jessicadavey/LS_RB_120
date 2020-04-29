KEYS = (1..9).to_a

answer = nil

loop do
  puts "Pick a number 1 - 9:"
  answer = gets.chomp
  break if KEYS.map(&:to_s).include?(answer)
  puts "Sorry, try again."
end

p answer.to_i