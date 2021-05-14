# frozen_string_literal: true

class Dealer < User
  def decision
    return :open if @hand.size == 3

    return :take if take_card?

    :skip
  end

  private

  def take_card?
    return true if @score < 17

    false
  end
end
