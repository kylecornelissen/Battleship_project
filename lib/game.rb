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
    puts "=============COMPUTER BOARD============="
    puts "#{@cpu.cpu_board.render(true)}"
    puts "==============PLAYER BOARD=============="
    puts "#{@player.player_board.render(true)}"
    puts "Enter the coordinate for your shot:\n> "
    @player_shot = gets.chomp.upcase
    @player.player_fires(@player_shot)
    @cpu.cpu_fires
    puts "Your shot on #{@player_shot} was a #{@cpu.cpu_board.cells[@player_shot].render}"
  end

  # def player_place_submarinerender
  #   if @cpu_board.cells[@player_shot].render == "."
  #
  # end



end
