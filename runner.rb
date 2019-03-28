require './lib/cell'
require './lib/ship'
require './lib/board'
require './lib/game'
require './lib/player'
require './lib/cpu'
require 'pry'

@game = Game.new
@game.welcome_message
