require 'pry'

class Player
  attr_accessor :hand

  def initialize
    @hand = []
  end

  def show_hand
    puts hand.map(&:join).join("  ")
  end

  def hit(deck)
    puts "You chose to hit."
    take_card(deck)
  end

  def stay
    puts "You chose to stay."
  end

  def take_card(deck)
    hand << deck.deal
  end

  def busted?
    total > 21
  end

  def get_values
    @hand.map(&:first).map do |value|
      if %w(J Q K).include?(value) then 10
      elsif value == "A" then 11
      else value
      end
    end
  end
  
  def total
    aces_to_handle = @hand.map(&:first).count("A")
    sum = get_values.sum
    loop do
      break if sum < 21 || aces_to_handle == 0
      sum -= 10
      aces_to_handle -= 1
    end
    sum
  end
end

class Dealer
  attr_accessor :hand

  def initialize
    @hand = []
  end

  def show_first_card
    hand.first.join
  end

  def take_card(deck)
    hand << deck.deal
  end

  def hit
  end

  def stay
  end

  def busted?
    true
  end

  def total
  end
end

class Participant
end

class Deck
  SPADE = "\xE2\x99\xA0"
  HEART = "\xE2\x99\xA1"
  DIAMOND = "\xE2\x99\xA2"
  CLUB = "\xE2\x99\xA3"

  SUITS = [SPADE, HEART, DIAMOND, CLUB]
  VALUES = (2..10).to_a + %w(J Q K A)

  DECK_OF_CARDS = VALUES.product(SUITS)

  def initialize
    @cards = DECK_OF_CARDS.shuffle
  end

  def deal
    @cards.pop
  end
end

class Game

  def initialize
    @deck = Deck.new
    @player = Player.new
    @dealer = Dealer.new
  end

  def start
    display_welcome_message
    deal_cards
    show_initial_cards
    player_turn
    # dealer_turn
    # show_result
  end

  def display_welcome_message
    puts " #{Deck::SPADE} #{Deck::DIAMOND} Welcome to 21! #{Deck::HEART} #{Deck::CLUB}"
  end

  def deal_cards
    2.times do 
      player.take_card(deck)
      dealer.take_card(deck)
    end
  end

  def show_initial_cards
    puts "Your cards:" 
    player.show_hand
    puts "Dealer shows:"
    puts dealer.show_first_card
  end

  def player_turn
    loop do
      answer = ask_player
      break if answer == "s"
      player.hit(deck)
      player.show_hand
      next unless player.busted?
      puts "You busted!  Game over!"
      return
    end
      player.stay
      player.show_hand
  end

  def ask_player
    answer = nil
    loop do
      puts "Hit (h) or Stay (s)?"
      answer = gets.chomp.downcase
      break if %w(h s).include? answer
      puts "You must choose h or s."
    end
    answer
  end

  private

  attr_reader :deck
  attr_accessor :player, :dealer
end

Game.new.start
