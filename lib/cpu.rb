class Cpu
  attr_reader :ships,
              :cpu_board,
              :player_board
  def initialize(cpu_board, player_board)
    @cpu_board = cpu_board
    @player_board = player_board
    @ships = [Ship.new("Submarine", 2), Ship.new("Cruiser", 3)]
  end

  def cpu_place
    coords = []
    @ships.each do |ship|
      while !@cpu_board.valid_placement?(ship, coords)
        coords = @cpu_board.cells.keys.sample(ship.length)
      end
      @cpu_board.place(ship, coords)
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
