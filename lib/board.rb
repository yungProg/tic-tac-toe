# frozen_string_literal: true

# Class representing a Tic-Tac-Toe board
class Board
  def initialize
    @grid = Array.new(9)
  end

  def display
    puts @grid
  end

  def valid_move?(position)
    !@grid[position] && position.between?(0, 8)
  end

  def place_mark(position, player_mark)
    if valid_move?(position)
      @grid[position] = player_mark
    else
      puts 'Invalid move. Please try again.'
    end
  end

  def check_winner
    winning_sequence = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    possible_combinations = winning_sequence.length
    possible_combinations.times do |count|
      sequence = [@grid[winning_sequence[count][0]], @grid[winning_sequence[count][1]],
                  @grid[winning_sequence[count][2]]]
      puts count
      return true if sequence.all?('X') || sequence.all?('O')
    end
  end
end
