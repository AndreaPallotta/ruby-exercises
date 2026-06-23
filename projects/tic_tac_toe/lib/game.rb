require_relative "board"
require_relative "player"

class Game
  def initialize(player1, player2)
    @board = Board.new()
    @players = [player1, player2]
    @active_player_id = 0
    @turn = 0
    puts "#{@players[@active_player_id].name} goes first"
  end
  attr_reader :board, :active_player_id, :turn

  def switch_active_player!
    @active_player_id = 1 - @active_player_id
  end

  def play_turn
    active_player = @players[@active_player_id]
    @turn += 1

    print "Turn [#{@turn}] - Player '#{active_player.name}' make your move (X,Y): "
    loop do
      coords = active_player.input_move
      unless coords.length == 2 && coords.all? { |el| el.match?(/\A\d+\z/) }
        print "Invalid coordinates. Try again: "
        next
      end

      row, col = coords.map(&:to_i)
      success, message = @board.set_played_cell(row, col, active_player)
      unless success
        print "#{message} - Try again: "
      else
        puts message
        @board.display
        break
      end
    end
  end

  def play
    loop do
      active_player = @players[@active_player_id]
      play_turn
      if @board.has_player_won?(active_player)
        puts "Player [#{active_player.name}] won!"
        break
      end

      if @board.board_full?
        puts "It's a tie!"
        break
      end

      switch_active_player!
    end
  end
end
