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
    @cpu = CPU.new
    @game = Game.new
    @cpu_board = Board.new
    @player_board = Board.new
    @ships = [Ship.new("Submarine", 2), Ship.new("Cruiser", 3)]
  end

  def test_if_CPU_class_exists
    assert_instance_of CPU, @cpu
  end

  def test_computer_places_ship

    @cpu.computer_place
    
    expected = "  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n"
    assert_equal expected, @cpu.cpu_board.render

    puts @cpu.cpu_board.render(true)
  end

end
