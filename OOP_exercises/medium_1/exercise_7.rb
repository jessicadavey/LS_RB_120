class GuessingGame
  def initialize(min, max)
    @min = min
    @max = max
  end

  def play
    reset
    loop do
      display_guesses_remaining
      player_guesses
      display_guess_result
      break if !guesses_remaining? || correct_guess?
    end
    display_overall_result
  end

  private

  attr_reader :target, :number_of_guesses

  def display_guesses_remaining
    puts "You have #{number_of_guesses} guesses remaining."
  end

  def player_guesses
    guess = nil
    puts "Enter a number between #{@min} and #{@max}."
    loop do
      guess = gets.chomp.to_i
      break if (@min..@max).cover?(guess)
      puts "Invalid guess. Enter a number between #{@min} and #{@max}."
    end
    @player_guess = guess
    decrement_guesses
  end

  def display_guess_result
    if correct_guess?
      puts "That's the number!"
    elsif @player_guess > @target
      puts "Your guess is too high."
    elsif @player_guess < @target
      puts "Your guess is too low."
    end
  end

  def display_overall_result
    if correct_guess?
      puts "You won!"
    else
      puts "You have no more guesses.  You lost!"
    end
  end

  def decrement_guesses
    @number_of_guesses -= 1
  end

  def guesses_remaining?
    @number_of_guesses > 0
  end

  def correct_guess?
    @player_guess == @target
  end

  def reset
    @target = (@min..@max).to_a.sample
    @number_of_guesses = Math.log2(@max - @min).to_i + 1
  end
end

game = GuessingGame.new(501, 1500)
game.play

# You have 10 guesses remaining.
# Enter a number between 501 and 1500: 104
# Invalid guess. Enter a number between 501 and 1500: 1000
# Your guess is too low.

# You have 9 guesses remaining.
# Enter a number between 501 and 1500: 1250
# Your guess is too low.

# You have 8 guesses remaining.
# Enter a number between 501 and 1500: 1375
# Your guess is too high.

# You have 7 guesses remaining.
# Enter a number between 501 and 1500: 80
# Invalid guess. Enter a number between 501 and 1500: 1312
# Your guess is too low.

# You have 6 guesses remaining.
# Enter a number between 501 and 1500: 1343
# Your guess is too low.

# You have 5 guesses remaining.
# Enter a number between 501 and 1500: 1359
# Your guess is too high.

# You have 4 guesses remaining.
# Enter a number between 501 and 1500: 1351
# Your guess is too high.

# You have 3 guesses remaining.
# Enter a number between 501 and 1500: 1355
# That's the number!

# You won!

game.play
# You have 10 guesses remaining.
# Enter a number between 501 and 1500: 1000
# Your guess is too high.

# You have 9 guesses remaining.
# Enter a number between 501 and 1500: 750
# Your guess is too low.

# You have 8 guesses remaining.
# Enter a number between 501 and 1500: 875
# Your guess is too high.

# You have 7 guesses remaining.
# Enter a number between 501 and 1500: 812
# Your guess is too low.

# You have 6 guesses remaining.
# Enter a number between 501 and 1500: 843
# Your guess is too high.

# You have 5 guesses remaining.
# Enter a number between 501 and 1500: 820
# Your guess is too low.

# You have 4 guesses remaining.
# Enter a number between 501 and 1500: 830
# Your guess is too low.

# You have 3 guesses remaining.
# Enter a number between 501 and 1500: 835
# Your guess is too low.

# You have 2 guesses remaining.
# Enter a number between 501 and 1500: 836
# Your guess is too low.

# You have 1 guesses remaining.
# Enter a number between 501 and 1500: 837
# Your guess is too low.

# You have no more guesses. You lost!