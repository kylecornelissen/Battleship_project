require 'minitest/autorun'
require 'minitest/pride'
require './lib/cell'
require './lib/ship'
require './lib/board'
require 'pry'

class BoardTest < Minitest::Test

  def setup
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("submarine", 2)
  end

  def test_if_board_class_exists
    assert_instance_of Board, @board
  end

  def test_if_the_board_creates_cells

    assert_equal 16, @board.cells.length
  end

  def test_if_coordinate_is_valid
    assert @board.valid_coordinate?("A1")
    assert @board.valid_coordinate?("D4")
    refute @board.valid_coordinate?("A5")
    refute @board.valid_coordinate?("E1")
    refute @board.valid_coordinate?("A22")
  end

  def test_if_placement_of_ship_is_valid
    refute @board.valid_placement?(@cruiser, ["A1", "A2"])
    refute @board.valid_placement?(@submarine, ["A2", "A3", "A4"])
    assert @board.valid_placement?(@cruiser, ["A2", "A3", "A4"])
  end

  def test_if_placement_of_ship_has_consecutive_coordinates
    refute @board.valid_placement?(@cruiser, ["A1", "A2", "A4"])
    refute @board.valid_placement?(@submarine, ["A2", "C1"])
    refute @board.valid_placement?(@cruiser, ["A3", "A2", "A1"])
    refute @board.valid_placement?(@cruiser, ["C1", "B1"])
    assert @board.valid_placement?(@cruiser, ["A2", "A3", "A4"])
  end
end