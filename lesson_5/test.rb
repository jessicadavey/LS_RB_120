require 'pry'

def get_values(cards)
  cards.map(&:first).map do |value|
    if %w(J Q K).include?(value) then 10
    elsif value == "A" then 11
    else value
    end
  end
end

def total(cards)
  aces_to_handle = cards.map(&:first).count("A")
  sum = get_values(cards).sum
  loop do
    break if sum < 21 || aces_to_handle == 0
    sum -= 10
    aces_to_handle -= 1
  end
  sum
end

p total([["Q", "♣"], [5, "♡"], [3, "♡"], [4, "♣"]]) == 22
p total([[10, "♡"], ["A", "♣"], ["K", "♢"], [5, "♢"], ["A", "♠"]]) == 27
p total([[4, "♢"], [6, "♣"], ["A", "♣"], [8, "♢"]]) == 19
p total([[4, "♣"], [2, "♢"], ["A", "♡"]]) == 17
p total([["A", "♣"], ["A", "♢"], [3, "♢"], [9, "♠"]]) == 14
