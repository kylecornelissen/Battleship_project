require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/ship'

class ShipTest < Minitest::Test
  def test_ship_exists
    cruiser = Ship.new("Cruiser", 3)
    assert_instance_of Ship, cruiser
  end
end
