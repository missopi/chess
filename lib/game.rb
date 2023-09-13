require_relative '../lib/chessboard'
require_relative '../lib/piece'
require_relative '../lib/player'

# class for the chess gameplay
class Game
  attr_reader :board

  def initialize(turn = 1)
    @board = Chessboard.new
    @turn = turn
  end

  def instructions
    puts "\n"
    puts '-------------------- Chess -----------------------'
    puts "\n"
    puts 'Instructions for how to play chess can be found at'
    puts 'https://en.wikipedia.org/wiki/Chess.'
    puts "\n"
  end

  def starting_position
    8.times do |x|
      board[[1, x]] = Pawn.new(:black)
      board[[6, x]] = Pawn.new(:white)
    end

    board[[0, 0]] = Rook.new(:black)
    board[[0, 1]] = Knight.new(:black)
    board[[0, 2]] = Bishop.new(:black)
    board[[0, 3]] = Queen.new(:black)
    board[[0, 4]] = King.new(:black)
    board[[0, 5]] = Bishop.new(:black)
    board[[0, 6]] = Knight.new(:black)
    board[[0, 7]] = Rook.new(:black)
    board[[7, 0]] = Rook.new(:white)
    board[[7, 1]] = Knight.new(:white)
    board[[7, 2]] = Bishop.new(:white)
    board[[7, 3]] = Queen.new(:white)
    board[[7, 4]] = King.new(:white)
    board[[7, 5]] = Bishop.new(:white)
    board[[7, 6]] = Knight.new(:white)
    board[[7, 7]] = Rook.new(:white)
  end

  def create_player(number)
    puts "\nPlayer #{number}, enter your name:"
    name = gets.chomp.capitalize!
    player_color = color[number - 1]
    Player.new(name, player_color)
  end

  def assign_current_player(turn)
    turn.odd? ? @player_one : @player_two
  end

  def play() end

  def player_turn(player) end

  def player_input(current_player) end

  def valid_move?(move) end

  def space_available?(move) end

  def ask_promotion_piece() end

  def make_move(move) end

  def game_over?() end
end

game = Game.new
game.starting_position
p game.board
