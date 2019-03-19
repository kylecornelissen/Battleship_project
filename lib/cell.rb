class Cell
  attr_reader :coordinate,
              :empty

  def initialize(coordinate)
    @coordinate = coordinate
    @empty = true
  end

  def ship
    if @empty = true
      nil
    end
  end

  def empty?
    @empty
  end
end
