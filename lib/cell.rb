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

  def render(*)
    if @fired_upon == false && @ship == nil
      "."
    elsif @fired_upon == false && @ship != nil
      "S"
    elsif @fired_upon == true && @ship == nil
      "M"
    elsif @fired_upon == true && @ship != nil
      "H"
    end

  end


end
