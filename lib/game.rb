# frozen_string_literal: true

# Class representing a Tic-Tac-Toe game
class Game
  def initialize(player1, mark1, player2, mark2)
    @player1 = Player.new(player1, mark1)
    @player2 = Player.new(player2, mark2)
    @board = Board.new
    @current_player = @player1
  end

  def confirm_position
    position = @current_player.move
    until @board.valid_move?(position)
      puts 'Invalid move. Please try again.'
      position = @current_player.move
    end
    @board.place_mark(position, @current_player.mark)
  end

  def play # rubocop:disable Metrics/MethodLength
    loop do
      @board.display
      confirm_position
      if @board.check_winner
        puts "#{@current_player.name} won!"
        play_again?
        break
      end
      if @board.full?
        puts 'It is a tie!'
        play_again?
        break
      end
      switch_player
    end
  end

  def switch_player
    @current_player = @current_player == @player1 ? @player2 : @player1
  end

  def play_again?
    puts 'Do you want to replay? [Yes/No]'
    replay = gets.chomp
    return unless replay == 'Yes'

    @board = Board.new
    @current_player = @player1
    play
  end
end
