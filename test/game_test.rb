require 'minitest/autorun'
require 'minitest/pride'
require './lib/cell'
require './lib/ship'
require './lib/board'
require './lib/game'
require 'pry'

class GameTest < Minitest::Test

  def setup
    @game = Game.new
    @cpu_board = Board.new
    @player_board = Board.new
    @ships = [Ship.new("Submarine", 2), Ship.new("Cruiser", 3)]
  end

  def test_game_exists
    skip
    assert_instance_of Game, @game
  end

  def test_welcome_message
    skip
    assert_equal "Welcome to BATTLESHIP\nEnter p to play. Enter q to quit.", @game.welcome_message
  end

end
