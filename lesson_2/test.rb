moves = %w(rock paper scissors lizard spock)

name = "Jessica"

history = ""

moves.each_with_index do |move, i|
  history.prepend(" #{i + 1}: #{move}")
end

history.prepend("#{name} >>")

puts history 