class Player
  def initialize(name, sign)
    @name = name
    @sign = sign
  end
  attr_reader :name, :sign

  def input_move
    gets.chomp.split(",").map(&:strip)
  end
end
