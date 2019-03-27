class Game
  attr_reader :cpu_board,
              :ships,
              :player_board,
              :player,
              :cpu,
              :player_shot

  def initialize
    @cpu_board = Board.new
    @player_board = Board.new
    @player = Player.new(@cpu_board, @player_board)
    @cpu = Cpu.new(@cpu_board, @player_board)
    @ships = [Ship.new("Submarine", 2), Ship.new("Cruiser", 3)]
    @player_shot = nil
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
    @player.player_places_ships
    the_turn
  end

  def the_turn
    player_hits = 0
    computer_hits = 0
    until player_hits == 5 || computer_hits == 5
      puts "=============COMPUTER BOARD============="
      puts "#{@cpu.cpu_board.render(true)}"
      puts "==============PLAYER BOARD=============="
      puts "#{@player.player_board.render(true)}"
      puts "Enter the coordinate for your shot:\n> "
      @cpu.cpu_fires
      @player_shot = gets.chomp.upcase
      @player.player_fires(@player_shot)
      puts "My shot on #{@cpu.dat_cell.coordinate} #{computer_place_render}"
      puts "Your shot on #{@player_shot} #{player_place_render}"
      if @cpu_board.cells[@player_shot].render == "H"
        player_hits += 1
      elsif @player_board.cells[@cpu.dat_cell.coordinate].render == "H"
        cpu_hits += 1
      end
    end
  end

  def player_place_render
    if @cpu_board.cells[@player_shot].render == "M"
      "was a miss."
    elsif @cpu_board.cells[@player_shot].render == "H"
      "was a hit!"
    elsif @cpu_board.cells[@player_shot].render == "X"
      "sunk my ship!!"
    end
  end

  def computer_place_render
    if @player_board.cells[@cpu.dat_cell.coordinate].render == "M"
      "was a miss."
    elsif @player_board.cells[@cpu.dat_cell.coordinate].render == "H"
      "was a hit!"
    elsif @player_board.cells[@cpu.dat_cell.coordinate].render == "X"
      "sunk my ship!!"
    end

  end

end
