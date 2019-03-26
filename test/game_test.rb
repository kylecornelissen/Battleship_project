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
    @submarine = Ship.new("Submarine", 2)
    @cruiser = Ship.new("Cruiser", 3)
  end

  def test_game_exists
    assert_instance_of Game, @game
  end

  def test_welcome_message
    assert_equal "Welcome to BATTLESHIP\nEnter p to play. Enter q to quit.", @game.welcome_message
  end

  def test_computer_places_ship

    @game.computer_place

    @board.cells["A1"].fire_upon
    @board.cells["A2"].fire_upon
    @board.cells["A3"].fire_upon
    @board.cells["A4"].fire_upon
    @board.cells["B1"].fire_upon
    @board.cells["B2"].fire_upon
    @board.cells["B3"].fire_upon
    @board.cells["B4"].fire_upon
    @board.cells["C1"].fire_upon
    @board.cells["C2"].fire_upon
    @board.cells["C3"].fire_upon
    @board.cells["C4"].fire_upon
    @board.cells["D1"].fire_upon
    @board.cells["D2"].fire_upon
    @board.cells["D3"].fire_upon
    @board.cells["D4"].fire_upon


    expected = "  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n"
    assert_equal expected, @board.render(true)
  end

  # def test_player_places_ship
  #   assert_equal something ,@game.player_place(@cruiser)
  # end
end
