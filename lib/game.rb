

class Game
  attr_reader :board,
              :cruiser
  def initialize
    @board = Board.new
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
    coordinates = []
    @ships.each do |ship|
      loop do
        coordinates = @board.cells.keys.sample(ship.length)

          if @board.valid_placement?(ship, coordinates)
            @board.place(ship, coordinates)
            break
          end
      end
    end




  end


end
