# frozen_string_literal: true

# Contains everything for castling move
module Castling
  # check king is in start position
  def king_at_start?(from)
    king = self[from]
    king.is_a?(King)
    king.color == :white && from == [7, 4] || king.color == :black && from == [0, 4]
  end

  # find and identify chosen rook to do castling with
  def rooks(from, to)
    king = self[from]
    rooks = board.flatten.find_all do |piece|
      piece.is_a?(Rook) && piece.color == king.color
    end
    identify_rook(rooks, to)
  end

  def identify_rook(rooks, to)
    if to[1] == 6
      rooks.find { |rook| rook if rook.location[1] == 7 }
    elsif to[1] == 2
      rooks.find { |rook| rook if rook.location[1] == 0 }
    end
  end

  def kingside_castling(king, rook)
  end

  def queenside_castling(king, rook)
  end
end