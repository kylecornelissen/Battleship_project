class Game
  def initialize

  end

  def welcome_message
    "Welcome to BATTLESHIP\nEnter p to play. Enter q to quit."
    entry = gets.chomp
    if entry == "q"
      break
    # else
    #   Game.start
    end
  end


  def computer_place(ship_arg)
    num = ship_arg.length
    start_num = @board.cells.shuffle.first
    array_of_coords = [start_num..length]

        #randomly generate an array of coordinates as long as the ship length
        #save numbers into array,


     array_of_coords.each do |coord|
       coord.valid_coordinate
     end

      placed_ships = ship_array.do each |cell|
        @cells[cell].place_ship
      end

      placed_ships.each do |ship|
        ship.valid_placement
      end

  end

  # def player_place(ship_arg)
  # "Please place your cruiser,"
  # cell_1 = gets.chomp
  # end

end
