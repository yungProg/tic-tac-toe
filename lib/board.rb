# frozen_string_literal: true

require 'colorize'
# Class representing a Tic-Tac-Toe board
class Board
  def initialize
    @grid = Array.new(9)
  end

  def display
    @grid.each_slice(3) do |row|
      row.each do |col_index|
        color = col_index.nil? ? :white : col_index == 'X' ? :red : :blue # rubocop:disable Style/NestedTernaryOperator
        col_index.nil? ? (print 'R '.colorize(:color)) : print("#{col_index} ".colorize(color))
      end
      puts
    end
  end

  def valid_move?(position)
    !@grid[position] && position.between?(0, 8)
  end

  def place_mark(position, player_mark)
    @grid[position] = player_mark
  end

  def check_winner
    w_sequence = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    possible_combinations = w_sequence.length
    possible_combinations.times do |count|
      sequence = [@grid[w_sequence[count][0]], @grid[w_sequence[count][1]], @grid[w_sequence[count][2]]]
      if sequence.all?('X') || sequence.all?('O')
        display
        return true
      end
    end
    false
  end
end
