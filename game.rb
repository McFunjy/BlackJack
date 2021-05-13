# frozen_string_literal: true

require_relative 'user'
require_relative 'dealer'
require_relative 'deck'
require_relative 'interface'

class Game
  BET = 10

  attr_reader :player, :dealer

  def initialize
    @num_round = 0
    @bet = BET
  end

  def start_game
    welcome_part
    new_round!
  end

  def welcome_part
    puts 'Добро пожаловать в игру Black Jack'
    puts 'Введите имя'
    name = gets.chomp
    @player = User.new(name)
    @dealer = Dealer.new
    @interface = Interface.new(@player, @dealer)
  end

  def new_round!
    @num_round += 1
    @deck = Deck.new
    @player.hand.clear
    @dealer.hand.clear
    @interface.show_new_round(@num_round)
    @player.take_card(2, @deck)
    @dealer.take_card(2, @deck)
    @interface.show_field
  end
end
