# frozen_string_literal: true

class User
  attr_reader :hand, :bank, :name, :score

  def initialize(name = 'Dealer')
    @name = name
    @hand = []
    @score = 0
    @bank = 100
  end

  def take_card(number, deck)
    number.times { @hand << deck.take_card }
    calculate_score
  end

  def make_bet(bet)
    @bank -= bet
  end

  def show
    @hand.reduce('') { |field, card| field + "#{card.name} " }
  end

  def decision
    Interface::CHOICES[gets.chomp][:action]
  end

  def return_bet(bet)
    @bank += bet
  end

  protected

  def calculate_score
    @score = 0
    @hand.each { |card| @score += card.points }
    @score += 10 if a? && @score <= 11
  end

  def a?
    return true if @hand.detect { |card| card.points == 1 }

    false
  end
end
