class Game
  attr_reader :cpu_board,
              :ships
  def initialize
    @cpu_board = Board.new
    @player_board = Board.new
    @ships = [Ship.new("Submarine", 2), Ship.new("Cruiser", 3)]

  end

  def welcome_message
    "Welcome to BATTLESHIP\nEnter p to play. Enter q to quit."
    # entry = gets.chomp
    # if entry == "q"
    #   break
    # # else
    # #   Game.start
    # end
  end

  def computer_place
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




  def player_place
    p "I have laid out my ships on the grid\nYou now need to lay out your two ships.\nThe Cruiser is three units long and the Submarine is two units long.\n"
    p "  1 2 3 4 \nA . . . . \nB . . . . \nC . . . . \nD . . . . \n"
    p "Enter the squares for the Cruiser (3 spaces):\n> "

  end




end
