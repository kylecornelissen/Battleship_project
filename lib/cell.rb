class Cell
  attr_reader :coordinate,
              :ship,
              :fired_upon

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_upon = false
  end

  def empty?
    if @ship == nil
      true
    else
      false
    end
  end

  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    @fired_upon = true
      if empty? != true
        @ship.hit
      end
  end

  def render(reveal = false)
    if @fired_upon == false && @ship == nil
      "." # no ship, no fire upon
    elsif @fired_upon == false && @ship != nil && reveal
      "S" # SHIP: ship, no fire upon, revealed
    elsif @fired_upon == false && @ship != nil && !reveal
      "." # ship, no fire upon, not revealed
    elsif @fired_upon == true && @ship == nil
      "M" # MISSED: no ship, fired upon
    elsif @fired_upon == true && @ship != nil && @ship.sunk? != true
      "H" # HIT: ship, fired upon
    elsif @fired_upon == true && @ship != nil && @ship.sunk? == true
      "X" # SUNK ship fired upon
    end
  end

end
