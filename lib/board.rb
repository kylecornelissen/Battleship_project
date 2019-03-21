class Board
  attr_reader :cells

  def initialize
    @cells = {
      "A1" => Cell.new("A1"),
      "A2" => Cell.new("A2"),
      "A3" => Cell.new("A3"),
      "A4" => Cell.new("A4"),
      "B1" => Cell.new("B1"),
      "B2" => Cell.new("B2"),
      "B3" => Cell.new("B3"),
      "B4" => Cell.new("B4"),
      "C1" => Cell.new("C1"),
      "C2" => Cell.new("C2"),
      "C3" => Cell.new("C3"),
      "C4" => Cell.new("C4"),
      "D1" => Cell.new("D1"),
      "D2" => Cell.new("D2"),
      "D3" => Cell.new("D3"),
      "D4" => Cell.new("D4")
    }
  end

  def valid_coordinate?(coordinate)
    @cells.include?(coordinate)
  end

  def valid_placement?(ship, coordinates)
    split_coordinates = split_coordinates(coordinates)
    store_letters = store_letters(split_coordinates)
    store_numbers = store_numbers(split_coordinates)
    letters_to_ordinals = letters_to_ordinals(store_letters)
    consecutive_letters = consecutive_letters?(letters_to_ordinals)
    consecutive_numbers = consecutive_numbers?(store_numbers)


    if consecutive_letters && consecutive_numbers == false && (ship.length == coordinates.length) && overlapped?(coordinates)
        true
    elsif consecutive_letters == false && consecutive_numbers && ship.length == coordinates.length && overlapped?(coordinates)
        true
    else
        false
    end
  end

  def split_coordinates(coordinates)
    coordinates.map do |coordinate|
      coordinate.split(//)
    end.flatten
  end

  def store_letters(split_coordinates)
    split_coordinates.map.with_index do |char, index|
      if index == 0 || index % 2 == 0
        char
      end
    end.compact
  end

  def store_numbers(split_coordinates)
    split_coordinates.map.with_index do |num, index|
      if index % 2 != 0
        num.to_i
      end
    end.compact
  end

  def letters_to_ordinals(store_letters)
    store_letters.map do |letter|
      letter.ord
    end
  end

  def consecutive_letters?(letters_to_ordinals)
    letters_to_ordinals.each_cons(2).all? do |x,y|
      y == x + 1
    end
  end

  def consecutive_numbers?(store_numbers)
    store_numbers.each_cons(2).all? do |a,b|
      b == a + 1
    end
  end

  def place(ship, coordinates)
    coordinates.each do |coordinate|
      @cells[coordinate].place_ship(ship)
    end
  end

  def overlapped?(coordinates)
    coordinates.all? do |coord|
      @cells[coord].empty?
    end

  end

  def render(*)

    row_1 = "  1 2 3 4 \n"
    row_2 = "A #{@cells["A1"].render} #{@cells["A2"].render} #{@cells["A3"].render} #{@cells["A4"].render} \n"
    row_3 = "B #{@cells["B1"].render} #{@cells["B2"].render} #{@cells["B3"].render} #{@cells["B4"].render} \n"
    row_4 = "C #{@cells["C1"].render} #{@cells["C2"].render} #{@cells["C3"].render} #{@cells["C4"].render} \n"
    row_5 = "D #{@cells["D1"].render} #{@cells["D2"].render} #{@cells["D3"].render} #{@cells["D4"].render} \n"


    "#{row_1}#{row_2}#{row_3}#{row_4}#{row_5}"




  end



end
