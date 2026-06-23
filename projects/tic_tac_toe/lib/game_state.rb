require "io/console"
require_relative "player"
require_relative "enums"
require_relative "game"


class GameState
  def initialize
    @player_names = []
  end

  def get_player_name
    puts "Create New player"
    print "Name: "

    loop do
      name = gets.chomp.strip

      if name.empty?
        print "Invalid name. Try again: "
        next
      end

      if @player_names.include?(name)
        print "#{name} already exists. Try again: "
        next
      end

      @player_names << name
      return name
    end
  end

  def create_players
    player1 = Player.new(get_player_name, Sign::X)
    player2 = Player.new(get_player_name, Sign::O)

    [player1, player2]
  end

  def run
    player1, player2 = create_players

    loop do
      game = Game.new(player1, player2)
      game.play

      print "Do you want to play again(y/N)? "
      res = gets.chomp.strip.downcase

      unless ["y", "yes"].include? res
        break
      end

      $stdout.clear_screen
    end
  end
end
