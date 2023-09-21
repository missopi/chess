require_relative '../lib/chessboard'
require_relative '../lib/piece'
require_relative '../lib/player'
require_relative '../lib/render_board'

# class for the chess gameplay
class Game
  attr_reader :board, :player_one, :player_two, :color

  def initialize(turn = 1)
    @board = board
    @color = %i[white black]
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

  def create_player(number)
    puts "\nPlayer #{number}, enter your name:"
    name = gets.chomp.capitalize!
    player_color = color[number - 1]
    Player.new(name, player_color)
  end

  def assign_current_player(turn)
    turn.odd? ? player_one : player_two
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

