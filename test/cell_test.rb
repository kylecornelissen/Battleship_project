require 'minitest/autorun'
require 'minitest/pride'
require './lib/cell'
require './lib/ship'
require 'pry'

class CellTest < Minitest::Test

  def setup
    @cell = Cell.new("B4")
  end

  def test_if_cell_exists


    assert_instance_of Cell, @cell
  end

  def test_if_cell_coordinate_can_be_accessed
    assert_equal "B4", @cell.coordinate
  end

  def test_cell_begins_with_no_ship
    assert_nil @cell.ship
  end

  def test_if_cell_default_empty
    assert @cell.empty?
  end
end
