class GuessingGame
  def initialize
    reset
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
    puts "Enter a number between 1 and 100."
    loop do
      guess = gets.chomp.to_i
      break if (1..100).cover?(guess)
      puts "Invalid guess. Enter a number between 1 and 100."
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
    @target = (1..100).to_a.sample
    @number_of_guesses = 7
  end
end

game = GuessingGame.new
game.play
game.play

# You have 7 guesses remaining.
# Enter a number between 1 and 100: 104
# Invalid guess. Enter a number between 1 and 100: 50
# Your guess is too low.

# You have 6 guesses remaining.
# Enter a number between 1 and 100: 75
# Your guess is too low.

# You have 5 guesses remaining.
# Enter a number between 1 and 100: 85
# Your guess is too high.

# You have 4 guesses remaining.
# Enter a number between 1 and 100: 0
# Invalid guess. Enter a number between 1 and 100: 80

# You have 3 guesses remaining.
# Enter a number between 1 and 100: 81
# That's the number!

# You won!

# game.play

# You have 7 guesses remaining.
# Enter a number between 1 and 100: 50
# Your guess is too high.

# You have 6 guesses remaining.
# Enter a number between 1 and 100: 25
# Your guess is too low.

# You have 5 guesses remaining.
# Enter a number between 1 and 100: 37
# Your guess is too high.

# You have 4 guesses remaining.
# Enter a number between 1 and 100: 31
# Your guess is too low.

# You have 3 guesses remaining.
# Enter a number between 1 and 100: 34
# Your guess is too high.

# You have 2 guesses remaining.
# Enter a number between 1 and 100: 32
# Your guess is too low.

# You have 1 guesses remaining.
# Enter a number between 1 and 100: 32
# Your guess is too low.

# You have no more guesses. You lost!
