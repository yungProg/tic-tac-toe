# frozen_string_literal: true

# Class representing a Tic-Tac-Toe game
class Game
  def initialize(player1, mark1, player2, mark2)
    @player1 = Player.new(player1, mark1)
    @player2 = Player.new(player2, mark2)
    @board = Board.new
    @current_player = @player1
  end

  def play
    loop do
      @board.display
      position = current_player.move
      @board.place_mark(position, @current_player.mark) if @board.valid_move?(position)
      if @board.check_winner
        puts "#{@current_player.name} won!"
        break
      end
      switch_player
    end
  end

  def switch_player
    @current_player = @current_player == @player1 ? @player2 : @player1
  end

  def play_again?
    puts 'Do you want to replay?'
    replay = gets.chomp
    play if replay == 'Yes'
  end
end
