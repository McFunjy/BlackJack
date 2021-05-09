require_relative 'card'

class Deck
  attr_accessor :deck

  def initialize
    @deck = make_deck.shuffle
  end

  def delite_card
    @deck.pop
  end

  def make_deck
    @deck = []
    Card::RANKS.product(Card::SUITS).map { |rank, suit| @deck << Card.new(rank, suit) }
  end
end