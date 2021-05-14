# frozen_string_literal: true

class Game
  BET = 10

  def initialize
    @num_round = 0
    @bet = BET
  end

  def start_game
    welcome_part
    loop do
      new_round!
      main_part
    end
  end

  private

  def welcome_part
    puts 'Добро пожаловать в игру Black Jack'
    puts 'Введите имя'
    name = gets.chomp
    @player = User.new(name)
    @dealer = Dealer.new
    @interface = Interface.new
  end

  def new_round!
    @num_round += 1
    @deck = Deck.new
    @player.hand.clear
    @dealer.hand.clear
    @interface.show_new_round(@num_round)
    make_bets
    @player.take_card(2, @deck)
    @dealer.take_card(2, @deck)
    @interface.show_hiden_field(@player, @dealer)
  end

  def make_bets
    @player.make_bet(@bet)
    @dealer.make_bet(@bet)
  end

  def main_part
    movement
    @interface.show_field(@player, @dealer)
    check_winner(result)
    @interface.show_remains(@player, @dealer)
    check_loser
    continue
  end

  def movement
    return if move(@player) == :open
    return if move(@dealer) == :open

    move(@player)
  end

  def move(player)
    return :open if player.hand.size == 3

    @interface.show_choices unless player.name == 'Dealer'
    decision = player.decision
    @interface.show_decision(decision, player)
    return :open if decision == :open

    player.take_card(1, @deck) if decision == :take
    @interface.show_hiden_field(@player, @dealer)
  end

  def result
    return :draw if @player.score > 21 && @dealer.score > 21

    return @player if @dealer.score > 21
    return @dealer if @player.score > 21
    return @player if @player.score > @dealer.score
    return @dealer if @dealer.score > @player.score

    :draw
  end

  def check_winner(result)
    if result == :draw
      @interface.show_draw
      return_bets
    else
      @interface.show_winner(result)
      result.return_bet(@bet * 2)
    end
  end

  def return_bets
    @player.return_bet(@bet)
    @dealer.return_bet(@bet)
  end

  def check_loser
    if @player.bank < @bet
      @interface.loser(@player)
      exit!
    end
    if @dealer.bank < @bet
      @interface.loser(@dealer)
      exit!
    end
  end

  def continue
    @interface.show_continue
    choice = Interface::MENU[gets.chomp][:action]
    if choice == :exit
      @interface.show_end(@player)
      exit!
    end
  end
end
