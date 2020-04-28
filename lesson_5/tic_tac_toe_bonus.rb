require 'pry'

class Board
  attr_reader :squares

  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                  [[1, 5, 9], [3, 5, 7]]              # diagonals

  def initialize
    @squares = {}
    reset
  end

  # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
  def draw
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts "     |     |"
  end
  # rubocop:enable Metrics/AbcSize, Metrics/MethodLength

  def []=(key, marker)
    @squares[key].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if three_identical_markers?(squares)
        return squares.first.marker
      end
    end
    nil
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  private

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 3
    markers.min == markers.max
  end
end

class Square
  INITIAL_MARKER = " "

  attr_accessor :marker

  def initialize(marker = INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def marked?
    marker != INITIAL_MARKER
  end

  def unmarked?
    marker == INITIAL_MARKER
  end
end

class Player
  attr_reader :marker, :name

  def initialize(type = nil)
    return unless type == 'computer'
    @marker = "O"
    @name = ["Hal 9000", "Deep Thought", "C-3PO", "V-Ger", "Holly"].sample
  end

  def choose_marker
    choice = nil
    puts "Welcome #{name}!"
    loop do
      puts "Please type a character (not a space or O) to use as a marker."
      choice = gets.chomp
      break if choice.size == 1 && choice != " " && choice != "O"
      puts "Please try again."
    end
    @marker = choice
  end

  def set_name
    n = ""
    loop do
      puts "What is your name?"
      n = gets.chomp
      break unless n.empty?
      puts "You must enter a name."
    end
    @name = n
  end
end

class TTTGame
  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Player.new
    @computer = Player.new('computer')
  end

  def play
    start_game
    loop do
      display_board
      game_loop
      display_result
      break unless play_again?
      game_reset
    end

    display_goodbye_message
  end

  private

  def start_game
    clear
    display_welcome_message
    human.set_name
    human.choose_marker
    set_first_player
  end

  def clear
    system 'clear'
  end

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts ""
  end

  def set_first_player
    choice = nil
    loop do
      puts "Would you like to go first? (y/n)"
      choice = gets.chomp.downcase
      break if %w(y n).include?(choice)
      puts "You must answer y or n."
    end
    @current_marker = choice == "y" ? human.marker : computer.marker
  end

  def display_board
    puts "#{human.name} is a #{human.marker}. "\
         "#{computer.name} is a #{computer.marker}."
    puts ""
    board.draw
    puts ""
  end

  def game_loop
    loop do
      current_player_moves
      break if board.someone_won? || board.full?
      clear_screen_and_display_board if human_turn?
    end
  end

  def current_player_moves
    if human_turn?
      human_moves
      @current_marker = computer.marker
    else
      computer_moves
      @current_marker = human.marker
    end
  end

  def human_turn?
    @current_marker == human.marker
  end

  def human_moves
    puts "Choose a square (#{board.unmarked_keys.join(', ')}):"
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice."
    end
    board[square] = human.marker
  end

  def computer_moves
    square = if square_to_attack
               square_to_attack
             elsif square_to_defend
               square_to_defend
             elsif board.unmarked_keys.include?(5)
               5
             else
               board.unmarked_keys.sample
             end
    board[square] = computer.marker
  end

  def square_to_attack
    Board::WINNING_LINES.each do |line|
      marks = board.squares.values_at(*line).map(&:marker)
      if two_in_a_row?(marks, computer.marker)
        i = marks.index(Square::INITIAL_MARKER)
        return line[i]
      end
    end
    nil
  end

  def square_to_defend
    Board::WINNING_LINES.each do |line|
      marks = board.squares.values_at(*line).map(&:marker)
      if two_in_a_row?(marks, human.marker)
        i = marks.index(Square::INITIAL_MARKER)
        return line[i]
      end
    end
    nil
  end

  def two_in_a_row?(line, marker)
    line.count(marker) == 2 && line.count(Square::INITIAL_MARKER) == 1
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def display_result
    clear_screen_and_display_board

    case board.winning_marker
    when human.marker
      puts "#{human.name} won!"
    when computer.marker
      puts "#{computer.name} won!"
    else
      puts "It's a tie!"
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include?(answer)
      puts "Sorry, must be y or n."
    end

    answer == 'y'
  end

  def game_reset
    reset
    display_play_again_message
    set_first_player
  end

  def reset
    board.reset
    clear
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ""
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe! Goodbye!"
  end
end

game = TTTGame.new
game.play
