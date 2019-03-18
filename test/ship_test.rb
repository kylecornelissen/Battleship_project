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

end
