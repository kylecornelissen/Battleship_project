require 'minitest/autorun'
require 'minitest/pride'
require './lib/cell'
require './lib/ship'
require 'pry'

class CellTest < Minitest::Test
  def test_if_cell_exists
    cell = Cell.new("B4")

    assert_instance_of Cell, cell
  end
end
