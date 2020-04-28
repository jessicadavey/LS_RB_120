SPADE = "\xE2\x99\xA0"
HEART = "\xE2\x99\xA1"
DIAMOND = "\xE2\x99\xA2"
CLUB = "\xE2\x99\xA3"

SUITS = [SPADE, HEART, DIAMOND, CLUB]
VALUES = (2..10).to_a + %w(J Q K A)

DECK_OF_CARDS = VALUES.product(SUITS).map(&:join)

p DECK_OF_CARDS.size

hand = [[6, "+"], ["A", "*"]]

hand = hand.map(&:join).join("  ")

puts hand
