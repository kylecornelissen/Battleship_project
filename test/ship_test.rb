require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/ship'

class ShipTest < Minitest::Test

  def setup
    @cruiser = Ship.new("Cruiser", 3)
  end

  def test_ship_exists
    assert_instance_of Ship, @cruiser
  end

  def test_ship_has_attributes
    assert_equal "Cruiser", @cruiser.name
    assert_equal 3, @cruiser.length
  end

  def test_health_method
    assert_equal 3, @cruiser.health
  end

  def test_sunk_returns_false
    refute @cruiser.sunk?
  end

  def test_hit_takes_away_one_health_point
    @cruiser.hit

    assert_equal 2, @cruiser.health
  end

end
