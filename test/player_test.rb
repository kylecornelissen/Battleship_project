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
  end

  def test_if_player_class_exists
    assert_instance_of Player, @player
  end

  def test_player_can_place_ship_on_coordinates
    expected = "  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . S S S \n"
    assert_equal expected, @player.player_board
  end
end
