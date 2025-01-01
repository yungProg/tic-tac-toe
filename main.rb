# frozen_string_literal: true

require_relative 'lib/board'
require_relative 'lib/game'
require_relative 'lib/player'

new_game = Game.new('Gideon', 'X', 'Mark', 'O')
new_game.play
