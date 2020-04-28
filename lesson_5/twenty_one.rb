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
  DECK_OF_CARDS = (1..52).to_a# all 52 cards

  def initialize
    @cards = DECK_OF_CARDS.shuffle
  end

  def deal
    @cards.pop
  end
end

class Card
  def initialize
  end
end

class Game

  def initialize
    @deck = Deck.new
    @player = Player.new
    @dealer = Dealer.new
  end

  def start
    deal_cards
    show_initial_cards
    # player_turn
    # dealer_turn
    # show_result
  end

  def deal_cards
    2.times do 
      player.hand << deck.deal
      dealer.hand << deck.deal
    end
  end

  def show_initial_cards
    p player.hand
    p dealer.hand
  end

  private

  attr_reader :deck
  attr_accessor :player, :dealer
end

Game.new.start
