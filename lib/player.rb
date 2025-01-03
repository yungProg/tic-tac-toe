# frozen_string_literal: true

# Class representing Tic-tac-toe players
class Player
  attr_accessor :name, :mark

  def initialize(name, mark)
    @name = name
    @mark = mark
  end

  def move
    p "#{@name}, enter a number between 0 and 8 to make your move."
    gets.chomp.to_i
  end
end
