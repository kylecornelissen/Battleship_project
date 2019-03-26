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

  def test_computer_places_ship

    @game.computer_place

    expected = "  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n"
    assert_equal expected, @game.cpu_board.render

    puts @game.cpu_board.render(true)
  end

  # def player_place
  #   skip
  #   @game = Game.new
  #   @player_board = Board.new
  #
  #   assert_equal something ,@game.player_place(@cruiser)
  # end
end
