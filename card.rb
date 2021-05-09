class Card
  SUITS = ['♣', '♥', '♠', '♦']
  RANKS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']

  attr_reader :card, :points

  def initialize(rank, suit)
    @card = "#{rank}#{suit}"
    @points = point(rank)
  end

  def point(rank)
    return 1 if rank == 'A'
    return 10 if rank.is_a? String

    rank
  end
end