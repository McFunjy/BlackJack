# frozen_string_literal: true

class User
  attr_reader :hand, :bank, :name, :score

  def initialize(name = 'Dealer')
    @name = name
    @hand = Hand.new
    @bank = 100
  end

  def make_bet(bet)
    @bank -= bet
  end

  def decision
    Interface::CHOICES[gets.chomp][:action]
  end

  def return_bet(bet)
    @bank += bet
  end
end
