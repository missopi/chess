# frozen_string_literal: true

require_relative '../pieces/multimovable'

# subclass for bishop specific characteristics
class Bishop < Piece
  include Multimovable

  def possible_directions
    [
      [-1, 1],
      [1, 1],
      [-1, -1],
      [1, -1]
    ]
  end

  # print icon of piece
  def to_s
    color == :white ? ' ♗ ' : ' ♝ '
  end
end