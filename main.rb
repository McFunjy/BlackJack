# frozen_string_literal: true

require_relative 'card'
require_relative 'user'
require_relative 'dealer'
require_relative 'deck'
require_relative 'interface'
require_relative 'game'
require_relative 'hand'

game = Game.new
game.start_game
