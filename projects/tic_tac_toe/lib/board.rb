require_relative 'enums'

class Board
  def initialize
    @board = Array.new(3) { Array.new(3, Sign::DEFAULT) }
  end
  attr_reader :board

  def display
    cell_width = 3
    format_cell = ->(cell) { cell.to_s.center(cell_width) }

    separator = "+#{Array.new(@board.length, "-" * (cell_width)).join("+")}+"

    puts separator

    @board.each_with_index do |row, i|
      formatted_row = row.map { |cell| format_cell.call(cell) }.join("|")
      puts "|#{formatted_row}|"

      puts separator unless i == @board.length - 1
    end

    puts separator
  end

  def set_played_cell(row, col, player)
    if row < 0 || col < 0 || row > @board.length - 1 || col > @board.length - 1
      return false, "Row [#{row}] or Column [#{col}] is out of bound"
    end

    if @board[row][col] != Sign::DEFAULT
      return false, "Cell [#{row}][#{col}] is already occupied [#{@board[row][col]}]"
    end

    @board[row][col] = player.sign
    return true, "Set cell [#{row}][#{col}] to #{player.name}: #{player.sign}"
  end

  def free_cell_count
    @board.flatten.count { |cell| cell == sign::DEFAULT }
  end

  def row_win?(player)
    @board.any? { |row|
      row.all? { |cell| cell == player.sign }
    }
  end

  def col_win?(player)
    @board.transpose.any? { |col|
      col.all? { |cell| cell == player.sign }
    }
  end

  def diag_win?(player)
    len = @board.length - 1
    main_diag = (0..len).map { |i| @board[i][i] }
    anti_diag = (0..len).map { |i| @board[i][len - 1 - i] }

    main_diag.all? { |el| el == player.sign } || anti_diag.all? { |el| el == player.sign }
  end

  def has_player_won?(player)
    row_win?(player) || col_win?(player) || diag_win?(player)
  end

  def board_full?
    @board.flatten.none? { |cell| cell == Sign::DEFAULT }
  end
end
