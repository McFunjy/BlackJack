# frozen_string_literal: true

require_relative 'user'

class Dealer < User
  def take_card?
    return true if @score < 17

    false
  end
end
