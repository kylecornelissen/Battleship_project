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
  end

  def test_game_exists
    assert_instance_of Game, @game
  end

  def test_welcome_message
    assert_equal "Welcome to BATTLESHIP\nEnter p to play. Enter q to quit.", @game.welcome_message
  end

  def test_computer_places_ship
    @game.computer_place(@cruiser)
    assert_equal 3 , @cells.ship.length
  end

  # def test_player_places_ship
  #   assert_equal something ,@game.player_place(@cruiser)
  # end
end
