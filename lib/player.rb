class Player
  attr_reader :player_board,
              :cpu_board,
              :submarine,
              :cruiser
  def initialize
    @player_board = Board.new
    @cpu_board = Board.new
    @submarine = Ship.new("Submarine", 2)
    @cruiser = Ship.new("Cruiser", 3)
  end

  def player_places_ships
    player_place_cruiser
    player_place_submarine
  end

  def player_place_cruiser
    cruiser_coords = []
    puts "I have laid out my ships on the grid\nYou now need to lay out your two ships.\nThe Cruiser is three units long and the Submarine is two units long.\n"
    puts "  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n"
    loop do
      puts "Enter the first coordinate for the Cruiser (3 spaces):\n> "
      cruiser_coord1 = gets.chomp.upcase
      cruiser_coords << cruiser_coord1
      puts "Enter the second coordinate for the Cruiser (3 spaces):\n> "
      cruiser_coord2 = gets.chomp.upcase
      cruiser_coords << cruiser_coord2
      puts "Enter the third coordinate for the Cruiser (3 spaces):\n> "
      cruiser_coord3 = gets.chomp.upcase
      cruiser_coords << cruiser_coord3
      if @player_board.valid_placement?(@cruiser, cruiser_coords)
        @player_board.place(@cruiser, cruiser_coords)
        break
      else
        puts "Those are not valid coordinates. Please try again.\n"
      end
    end
  end

  def player_place_submarine
    sub_coords = []
    loop do
      puts "Enter the first coordinate for the Submarine (2 spaces):\n> "
      sub_coord1 = gets.chomp.upcase
      sub_coords << sub_coord1
      puts "Enter the second coordinate for the Submarine (2 spaces):\n> "
      sub_coord2 = gets.chomp.upcase
      sub_coords << sub_coord2
      if @player_board.valid_placement?(@submarine, sub_coords)
        @player_board.place(@submarine, sub_coords)
        break
      else
        puts "Those are not valid coordinates. Please try again.\n"
      end
    end
  end

  def player_fires(player_shot)
    @cpu_board.cells[player_shot].fire_upon
  end

end
