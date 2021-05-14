# frozen_string_literal: true

class Card
  SUITS = ['♣', '♥', '♠', '♦'].freeze
  RANKS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A'].freeze

  attr_reader :card, :points, :name

  def initialize(rank, suit)
    @name = "#{rank}#{suit}"
    @points = point(rank)
  end

  private

  def point(rank)
    return 1 if rank == 'A'
    return 10 if rank.is_a? String

    rank
  end
end
