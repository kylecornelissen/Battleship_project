class Cell
  attr_reader :coordinate,
              :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
  end



  def empty?
    @ship
  end

  # def place_ship(ship)
  #   @empty = false
  # end
end
