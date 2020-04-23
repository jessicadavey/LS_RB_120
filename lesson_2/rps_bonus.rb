class Score
  WIN_SCORE = 3

  attr_reader :human, :computer

  def initialize
    @human = 0
    @computer = 0
  end

  def reset
    @human = 0
    @computer = 0
  end

  def update(human_won, computer_won)
    if human_won
      @human += 1
    elsif computer_won
      @computer += 1
    end
  end

  def display(hum, comp)
    puts "Score:"
    puts "#{hum}: #{human}"
    puts "#{comp}: #{computer}"
  end

  private

  attr_writer :human, :computer
end

class Move
  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock']

  def initialize(value)
    @value = value
  end

  def scissors?
    @value == 'scissors'
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end
  
  def lizard?
    @value == 'lizard'
  end
  
  def spock?
    @value == 'spock'
  end

  def >(other_move)
    (rock? && (other_move.scissors? || other_move.lizard?)) ||
      (paper? && (other_move.rock? || other_move.spock?)) ||
      (scissors? && (other_move.paper? || other_move.lizard?)) ||
      (lizard? && (other_move.paper? || other_move.spock?)) ||
      (spock? && (other_move.rock? || other_move.scissors?))
  end

  def <(other_move)
    (rock? && (other_move.paper? || other_move.spock?)) ||
      (paper? && (other_move.scissors? || other_move.lizard?)) ||
      (scissors? && (other_move.rock? || other_move.spock?)) ||
      (lizard? && (other_move.scissors? || other_move.rock?)) ||
      (spock? && (other_move.paper? || other_move.lizard?))
  end

  def to_s
    @value
  end
end

class Player
  attr_accessor :move, :name

  def initialize
    set_name
  end

  def to_s
    name
  end
end

class Human < Player
  def set_name
    n = ""
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, must enter a value"
    end
    self.name = n
  end

  def choose
    choice = nil
    loop do
      puts "Please choose rock, paper, scissors, lizard, or spock:"
      choice = gets.chomp
      break if Move::VALUES.include? choice
      puts "Sorry, invalid choice."
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

# Game Orchestration Engine
class RPSGame
  attr_accessor :human, :computer, :score

  def initialize
    @human = Human.new
    @computer = Computer.new
    @score = Score.new
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors, Lizard, Spock!"
    puts "First to #{Score::WIN_SCORE} wins."
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors, Lizard, Spock.  Goodbye!"
  end

  def display_moves
    puts "#{human} chose #{human.move}."
    puts "#{computer} chose #{computer.move}."
  end

  def human_won?
    human.move > computer.move
  end

  def computer_won?
    human.move < computer.move
  end

  def display_winner
    if human_won?
      puts "#{human} won!"
    elsif computer_won?
      puts "#{computer} won!"
    else
      puts "It's a tie!"
    end
  end

  def game_over?
    score.human >= Score::WIN_SCORE || score.computer >= Score::WIN_SCORE
  end

  def display_grand_winner
    if score.human >= Score::WIN_SCORE
      puts "#{human} is the winner!"
    else
      puts "#{computer} is the winner!"
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include? answer.downcase
      puts "Sorry, must be y or n."
    end
    return true if answer == 'y'
    false
  end

  def play_round
    loop do
      human.choose
      computer.choose
      display_moves
      display_winner
      score.update(human_won?, computer_won?)
      score.display(human, computer)
      break if game_over?
    end
  end

  def play
    display_welcome_message
    loop do
      play_round
      display_grand_winner
      break unless play_again?
      score.reset
    end
    display_goodbye_message
  end
end

RPSGame.new.play
