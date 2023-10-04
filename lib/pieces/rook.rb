# frozen_string_literal: true

require_relative '../pieces/multimovable'

# subclass for rook specific characteristics
class Rook < Piece
  include Multimovable

  def possible_directions
    [
      [0, 1],
      [1, 0],
      [-1, 0],
      [0, -1]
    ]
  end

  # print icon of piece
  def to_s
    color == :white ? ' ♖ ' : ' ♜ '
  end
end
