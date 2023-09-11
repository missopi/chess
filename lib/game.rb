require_relative '../lib/chessboard'
require_relative '../lib/piece'
require_relative '../lib/player'

# class for the chess gameplay
class Game
  def initialize(turn = 1)
    @board = Board.new
    @turn = turn
  end

  def instructions() end

  def create_player(number) end

  def assign_current_player(player) end

  def play() end

  def player_turn(player) end

  def player_input(current_player) end

  def valid_move?(move) end

  def space_available?(move) end

  def ask_promotion_piece() end

  def make_move(move) end

  def game_over?() end
end
