require 'minitest/autorun'
require 'minitest/pride'
require './lib/cell'
require './lib/ship'
require './lib/board'
require './lib/game'
require './lib/cpu'
require './lib/player'
require 'pry'

class CPUTest < Minitest::Test

  def setup
    @player = Player.new
    @player_board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
  end

  def test_if_player_class_exists
    assert_instance_of Player, @player
  end

  def test_player_can_place_cruiser_on_coordinates
    @player.player_place_cruiser
    expected = "  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . S S S \n"
    assert_equal expected, @player.player_board.render(true)
  end

  def test_player_can_place_sub_on_coordinates
    @player.player_place_submarine
    expected = "  1 2 3 4 \nA . . . . \nB . S . . \nC . S . . \nD . . . . \n"
    assert_equal expected, @player.player_board.render(true)
  end
end
