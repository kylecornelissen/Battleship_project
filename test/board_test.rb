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
    # @ships = [Ship.new("Submarine", 2), Ship.new("Cruiser", 3)]
    # @cpu_board = Board.new
    # @player_board = Board.new
  end

  def test_if_board_class_exists
    skip
    assert_instance_of Board, @board
  end

  def test_if_the_board_creates_cells
    skip
    assert_equal Hash, @board.cells.class
    assert_equal 16, @board.cells.length
  end

  def test_if_coordinate_is_valid
    skip
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
    refute @board.valid_placement?(@submarine, ["A4", "B3"])
    refute @board.valid_placement?(@submarine, ["C3", "D2"])
    assert @board.valid_placement?(@submarine, ["B4", "C4"])
  end

  def test_if_method_splits_coordinates
    skip

    assert_equal ["A", "1", "A", "2"], @board.split_coordinates(["A1", "A2"])
  end

  def test_if_letters_can_be_stored_in_letters_array
    skip
    assert_equal ["A", "A"], @board.store_letters(["A", "1", "A", "2"])
    assert_equal ["B", "C", "D"], @board.store_letters(["B", "1", "C", "1", "D", "1"])
  end

  def test_if_numbers_can_be_stored_in_numbers_array
    skip
    assert_equal [1, 2], @board.store_numbers(["A", "1", "A", "2"])
    assert_equal [1, 1, 1], @board.store_numbers(["B", "1", "C", "1", "D", "1"])
  end

  def test_if_letters_can_be_converted_to_ordinals
    skip
    assert_equal [65, 65], @board.letters_to_ordinals(["A", "A"])
  end

  def test_if_method_detects_consecutive_letters
    skip
    refute @board.consecutive_letters?([65, 65])
    assert @board.consecutive_letters?([65, 66, 67])
    refute @board.consecutive_letters?([67, 65])
  end

  def test_if_method_detects_consecutive_numbers
    skip
    assert @board.consecutive_numbers?([1, 2])
    refute @board.consecutive_numbers?([1, 1, 1])
    refute @board.consecutive_numbers?([3, 1])
  end

  def test_if_placement_of_ship_has_consecutive_coordinates
    skip
    refute @board.valid_placement?(@cruiser, ["A1", "A2", "A4"])
    refute @board.valid_placement?(@submarine, ["A2", "C1"])
    refute @board.valid_placement?(@cruiser, ["A3", "A2", "A1"])
    refute @board.valid_placement?(@cruiser, ["C1", "B1"])
    assert @board.valid_placement?(@cruiser, ["A2", "A3", "A4"])
    refute @board.valid_placement?(@cruiser, ["E15", "E16", "E17"])
    refute @board.valid_placement?(@cruiser, ["A1", "A1", "A1"])
    refute @board.valid_placement?(@cruiser, ["A1", "D4"])
  end

  def test_if_placement_of_ship_does_not_have_diagonal_coordinates
    skip
    refute @board.valid_placement?(@cruiser, ["A1", "B2", "C3"])
    refute @board.valid_placement?(@submarine, ["C2", "D3"])
  end

  def test_if_placement_is_valid
    skip
    assert @board.valid_placement?(@submarine, ["A1", "A2"])
    assert @board.valid_placement?(@cruiser, ["B1", "C1", "D1"])
  end

  def test_place_method_return_ship_when_cells_called
    skip
    @board.place(@cruiser, ["A1", "A2", "A3"])
    @cell_1 = @board.cells["A1"]
    @cell_2 = @board.cells["A2"]
    @cell_3 = @board.cells["A3"]
    assert_equal @cruiser, @cell_1.ship
    assert_equal @cruiser, @cell_2.ship
    assert_equal @cruiser, @cell_3.ship
  end

  def test_we_cannot_overlap_ships
    skip
    @board.place(@cruiser, ["A1", "A2", "A3"])

    refute @board.valid_placement?(@submarine, ["A1", "B1"])
    assert @board.valid_placement?(@submarine, ["B2", "B3"])
  end

  def test_render_the_board
    skip
    @board.place(@cruiser, ["A1", "A2", "A3"])

    expected = "  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n"
    assert_equal expected, @board.render

    expected = "  1 2 3 4 \nA S S S . \nB . . . . \nC . . . . \nD . . . . \n"
    assert_equal expected, @board.render(true)

    @board.cells["A1"].fire_upon
    expected = "  1 2 3 4 \nA H S S . \nB . . . . \nC . . . . \nD . . . . \n"
    assert_equal expected, @board.render(true)

    @board.cells["A2"].fire_upon
    @board.cells["C3"].fire_upon
    @board.cells["A3"].fire_upon
    expected = "  1 2 3 4 \nA X X X . \nB . . . . \nC . . M . \nD . . . . \n"
    assert_equal expected, @board.render(true)
  end

  


end
