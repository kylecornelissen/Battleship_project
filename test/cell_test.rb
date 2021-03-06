require 'minitest/autorun'
require 'minitest/pride'
require './lib/cell'
require './lib/ship'
require 'pry' 

class CellTest < Minitest::Test

  def setup
    @cell = Cell.new("B4")
    @cruiser = Ship.new("Cruiser", 3)
    @cell_1 = Cell.new("B4")
    @cell_2 = Cell.new("C3")
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
    assert_equal true, @cell.empty?
  end

  def test_place_ship_occupies_coordinate
    @cell.place_ship(@cruiser)

    assert_equal @cruiser, @cell.ship
    assert_equal false, @cell.empty?
  end

  def test_fired_upon_returns_false
    assert_equal false, @cell.fired_upon?
  end

  def test_fired_upon_changes_ships_health
    @cell.place_ship(@cruiser)
    @cell.fire_upon
    assert_equal 2, @cell.ship.health
    assert_equal true, @cell.fired_upon?
  end

  def test_render_empty_cell_returns_dot
    assert_equal ".", @cell_1.render
  end

  def test_render_empty_cell_with_hit_returns_M
    @cell_1.fire_upon
    assert_equal "M", @cell_1.render
  end

  def test_render_returns_S_when_ship_present
    assert_equal ".", @cell_2.render
    @cell_2.place_ship(@cruiser)
    assert_equal "S", @cell_2.render(true)
  end

  def test_render_returns_H_when_ship_is_hit
    @cell_2.place_ship(@cruiser)
    @cell_2.fire_upon
    assert_equal "H", @cell_2.render
  end

  def test_less_than_three_hits_doesnt_sink_ship
    @cell_2.place_ship(@cruiser)
    @cell_2.fire_upon
    refute @cruiser.sunk?
  end

  def test_three_hits_sinks_ship
    @cell_2.place_ship(@cruiser)
    @cell_2.fire_upon
    @cruiser.hit
    @cruiser.hit
    assert @cruiser.sunk?
  end

  def test_three_hits_renders_X_on_sunk_coordinates
    @cell_2.place_ship(@cruiser)
    @cell_2.fire_upon
    @cruiser.hit
    @cruiser.hit
    assert @cruiser.sunk?
    assert_equal "X", @cell_2.render
  end



end
