# frozen_string_literal: true

# Contains everything for checkmate
module Checkmate
  def checkmate?(color)
    return false unless check?(color) # must be in check

    king_moves = king(color).valid_moves
    moves = []
    pieces.reject { |piece| piece.color == color }.each do |piece|
      moves.push(piece.valid_moves)
    end
    moves.flatten!(1)
    return true if (king_moves - moves).empty?

    false
  end
end