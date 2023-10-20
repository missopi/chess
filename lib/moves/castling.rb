# frozen_string_literal: true

# Contains everything for castling move
module Castling
  # identify current player's rooks
  def rook(color)
    pieces.select { |piece| piece.color == color && piece.is_a?(Rook) }
  end

  # check that at least one of the castles and the King are still in starting positions
  # king cannot do if in check
  # king cannot moves through check
  # king cannot move into check
  # king and castle swap places
  # can only do once per game
end