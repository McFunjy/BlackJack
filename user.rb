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
end