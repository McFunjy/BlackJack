# frozen_string_literal: true

class Hand
  attr_reader :cards, :score

  def initialize
    @cards = []
    @score = 0
  end

  def take_card(number, deck)
    number.times { @cards << deck.take_card }
    calculate_score
  end

  protected

  def calculate_score
    @score = 0
    @cards.each { |card| @score += card.points }
    @score += 10 if a? && @score <= 11
  end

  def a?
    return true if @cards.detect { |card| card.points == 1 }

    false
  end
end
