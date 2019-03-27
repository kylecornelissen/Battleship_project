require 'minitest/autorun'
require 'minitest/pride'
require './lib/cell'
require './lib/ship'
require './lib/board'
require './lib/game'
require './lib/player'
require './lib/cpu'
require 'pry'

class GameTest < Minitest::Test

  def setup
    @cpu_board = Board.new
    @player_board = Board.new
    @player = Player.new(@cpu_board, @player_board)
    @cpu = Cpu.new(@cpu_board, @player_board)
    @ships = [Ship.new("Submarine", 2), Ship.new("Cruiser", 3)]
    @game = Game.new
  end

  def test_game_exists
    skip
    assert_instance_of Game, @game
  end

  def test_welcome_message
    skip
    assert_equal "Welcome to BATTLESHIP\nEnter p to play. Enter q to quit.", @game.welcome_message
  end

  def test_if_the_turn_works
    skip
    expected = "=============COMPUTER BOARD=============" #\n#{@cpu.cpu_board.render}\n==============PLAYER BOARD==============\n#{@player.player_board.render(true)}"
    assert_equal expected, @game.the_turn
  end




end
