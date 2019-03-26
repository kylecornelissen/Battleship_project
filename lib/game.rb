class Game
  attr_reader :cpu_board,
              :ships,
              :player_board,
              :player,
              :cpu
  def initialize
    @cpu_board = Board.new
    @player_board = Board.new
    @player = Player.new
    @cpu = Cpu.new
    @ships = [Ship.new("Submarine", 2), Ship.new("Cruiser", 3)]

  end

  def welcome_message
    puts "Welcome to BATTLESHIP\nEnter p to play. Enter q to quit."
    entry = gets.chomp
    if entry == "q"
      puts "Goodbye!"
      exit!
    else
      start
    end
  end

  def start
    @cpu.cpu_place
    @player.player_place_ships
    the_turn
  end

  def the_turn
    puts "=============COMPUTER BOARD============="
    puts "#{@cpu_board.render}"
    puts "==============PLAYER BOARD=============="
    puts "#{@player_board.render(true)}"
    puts "Enter the coordinate for your shot:\n> "
    player_shot = gets.chomp.upcase
    @player.player_fires(player_shot)
    @cpu.cpu_fires
  end

end
