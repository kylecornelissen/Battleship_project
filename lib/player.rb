class Player
  attr_reader :player_board,
              :cpu_board,
              :ships
  def initialize
    @player_board = Board.new
    @cpu_board = Board.new
    @ships = [Ship.new("Submarine", 2), Ship.new("Cruiser", 3)]
  end
  def player_place
    cruiser_coords = []
    p "I have laid out my ships on the grid\nYou now need to lay out your two ships.\nThe Cruiser is three units long and the Submarine is two units long.\n"
    p "  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n"
    loop do
      p "Enter the first coordinate for the Cruiser (3 spaces):\n> "
      cruiser_coord1 = gets.chomp
      cruiser_coords << cruiser_coord1
      p "Enter the second coordinate for the Cruiser (3 spaces):\n> "
      cruiser_coord2 = gets.chomp
      cruiser_coords << cruiser_coord2
      p "Enter the third coordinate for the Cruiser (3 spaces):\n> "
      cruiser_coord3 = gets.chomp
      cruiser_coords << cruiser_coord3
      if @player_board.valid_placement?(@cruiser, cruiser_coords)
        @player_board.place(ship, cruiser_coords)
        break
      end
  end

end
