# frozen_string_literal: true

require_relative '../pieces/singlemovable'

# subclass for king specific characteristics
class King < Piece
  include Singlemovable

  def possible_directions
    [
      [0, 1],
      [1, 0],
      [-1, 0],
      [0, -1],
      [-1, 1],
      [1, 1],
      [-1, -1],
      [1, -1]
    ]
  end

  # print icon of piece
  def to_s
    color == :white ? ' ♔ ' : ' ♚ '
  end

  # finding out if any moves available whilst in check (otherwise becomes checkmate)
  def check_moves
    moves = []
    valid_moves.each do |move|
      test_board = board.duplicate
      test_board.move_piece(location, move)
      moves.push(move) unless board.check?(color)
    end
    moves
  end

  # once per game king can move 2 spaces and place rook on space skipped over
  def castling(location) end
end
