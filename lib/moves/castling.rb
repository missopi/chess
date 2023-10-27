# frozen_string_literal: true

# Contains everything for castling move
module Castling
  # actual castling move
  def do_castling_move(from, to)
    king = king_at_start(from)
    rook = rooks(from, to)
    move_king(from, to)
    castling_switch(to, rook)
    remove_piece(from)
  end

  # check king is in start position
  def king_at_start(from)
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
    row, column = to
    if column == 6
      rooks.find { |rook| rook if rook.location[1] == 7 }
    elsif column == 2
      rooks.find { |rook| rook if rook.location[1] == 0 }
    end
  end

  def move_king(from, to)
    king = self[from]
    self[to] = king
    king.location = to
  end

  def kingside_castling(to, rook)
    row, column = to
    board[row][column - 1] = rook
    board[row][column + 1] = NoPiece.instance
  end

  def queenside_castling(to, rook)
    row, column = to
    board[row][column + 1] = rook
    board[row][column + 2] = NoPiece.instance
  end

  def castling_switch(to, rook)
    row, column = to
    if column == 6
      kingside_castling(to, rook)
    elsif column == 2
      queenside_castling(to, rook)
    end
  end
end