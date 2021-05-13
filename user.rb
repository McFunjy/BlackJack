# frozen_string_literal: true

require_relative 'deck'

class User
  attr_reader :hand, :bank, :name, :score

  def initialize(name = 'Diler')
    @name = name
    @hand = []
    @score = 0
    @bank = 100
  end

  def take_card(number, deck)
    number.times { @hand << deck.take_card }
    calculate_score
  end

  def calculate_score
    @score = 0
    @hand.each { |card| @score += card.points }
    @score += 10 if a? && @score <= 11
  end

  def a?
    return true if @hand.detect { |card| card.points == 1 }

    false
  end

  def make_bet(bet)
    @bank -= bet
  end

  def show
    @hand.reduce('') { |field, card| field + "#{card.name} " }
  end
end
