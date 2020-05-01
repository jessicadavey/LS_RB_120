class Card
  include Comparable

  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    "#{rank} of #{suit}"
  end

  def value
    Deck::RANKS.index(rank)
  end

  def <=>(other)
    value <=> other.value
  end
end

class Deck

  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    reset
  end

  def draw
    reset if @cards.empty?
    @cards.pop
  end

  def reset
    create_cards
    shuffle_cards
  end

  def create_cards
    @cards = RANKS.product(SUITS).map do |rank, suit|
      Card.new(rank, suit)
    end
  end

  def shuffle_cards
    @cards.shuffle!
  end

end

deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
p drawn.count { |card| card.rank == 5 } == 4
p drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
p drawn2.count { |card| card.rank == 5 } == 4
p drawn2.count { |card| card.suit == 'Hearts' } == 13
p drawn != drawn2 # Almost always.
