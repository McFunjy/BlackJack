# frozen_string_literal: true

class Interface
  def initialize(player, dealer)
    @player = player
    @dealer = dealer
  end

  def show_new_round(num_round)
    puts "============= Раунд №#{num_round} ============"
  end

  def show_field
    puts "#{@player.name}: #{@player.show}  [#{@player.score}]"
    puts "#{@dealer.name}: #{'xx ' * @dealer.hand.count}  [XX]"
  end
end
