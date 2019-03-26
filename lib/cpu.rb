class Cpu
  attr_reader :cpu_board,
              :player_board,
              :ships
  def initialize
    @cpu_board = Board.new
    @player_board = Board.new
    @ships = [Ship.new("Submarine", 2), Ship.new("Cruiser", 3)]
  end

  def cpu_place
    coords = []

    @ships.each do |ship|
      loop do
        coords = @cpu_board.cells.keys.sample(ship.length)
        if @cpu_board.valid_placement?(ship, coords)
          @cpu_board.place(ship, coords)
          break
        end
      end
    end
  end

  def cpu_fires
    loop do
      dat_cell = @player_board.cells.values.sample
        if dat_cell.fired_upon? == false
          dat_cell.fire_upon
          break
        end
    end
  end

end
