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
    system "clear"
    puts "======Welcome to BATTLESHIP======\nEnter p to play. Enter q to quit."
    print "🚢⚓️ "
    entry = gets.chomp
    if entry == "p"
      system "clear"
      start
    elsif entry == "q"
      system "clear"
      puts "Goodbye! 👋"
      exit!
    else
      puts "Can't even handle the easiest task, huh? 😒"
      sleep(3.0)
      welcome_message
    end
  end

  def start
    reset
    @cpu.cpu_place
    @player.player_places_ships
    the_turn
  end

  def the_turn
    player_hits = 0
    cpu_hits = 0
    until player_hits == 5 || cpu_hits == 5
      puts "=============COMPUTER BOARD============="
      puts "#{@cpu.cpu_board.render}"
      puts "==============PLAYER BOARD=============="
      puts "#{@player.player_board.render(true)}"

      @cpu.cpu_fires

      valid = false
      until valid
        puts "Enter the coordinate for your shot:\n"
        print "🚢⚓️ "
        @player_shot = gets.chomp.upcase
        if @cpu_board.valid_coordinate?(player_shot) && !@cpu_board.cells[player_shot].fired_upon?
          @cpu_board.cells[player_shot].fire_upon
          valid = true
        else
          puts "That was an invalid selection. Please try again."
        end
      end
      system "clear"
      
      puts "My shot on #{@cpu.dat_cell.coordinate} #{computer_place_render}"
      sleep(1.0)
      puts "Your shot on #{@player_shot} #{player_place_render}"
      sleep(2.0)
      if @cpu_board.cells[@player_shot].render == "X"
        player_hits += 1
      elsif @player_board.cells[@cpu.dat_cell.coordinate].render == "X"
        cpu_hits += 1
      end

      if cpu_hits == 2
        puts "You lose 😳 Holy cow. 😬 How did you lose? 🤭 You are terrible at this."
        sleep(5.0)
        welcome_message
      elsif player_hits == 2
        puts "You win! Nice job! 🙌"
        sleep(5.0)
        welcome_message
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
      "sunk your ship!!"
    end
  end

  def reset
    @cpu_board = Board.new
    @player_board = Board.new
    @player = Player.new(@cpu_board, @player_board)
    @cpu = Cpu.new(@cpu_board, @player_board)
    @ships = [Ship.new("Submarine", 2), Ship.new("Cruiser", 3)]
    @player_shot = nil
    system "clear"
  end

end
