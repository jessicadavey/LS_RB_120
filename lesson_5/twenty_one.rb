require 'pry'

class Player
  attr_accessor :hand

  def initialize
    @hand = []
  end

  def hit
  end

  def stay
  end

  def busted?
  end

  def total
  end
end

class Dealer
  attr_accessor :hand

  def initialize
    @hand = []
  end

  def deal
  end

  def hit
  end

  def stay
  end

  def busted?
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
      player.hand << deck.deal
      dealer.hand << deck.deal
    end
  end

  def show_initial_cards
    puts "Your cards:" 
    puts player.hand.map(&:join).join("  ")
    puts "Dealer shows:"
    puts dealer.hand.first.join
  end

  def player_turn
    answer = ask_player
    if answer == "h"
      hit
    elsif answer == "s"
      stay
    end
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

  def hit
    puts "You chose to hit."
  end

  def stay
    puts "You chose to stay."
  end

  private

  attr_reader :deck
  attr_accessor :player, :dealer
end

Game.new.start
