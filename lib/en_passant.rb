# frozen_string_literal: true

# Contains everything for en-passant move
module EnPassant
  def correct_row(from)
    piece = self[from]
    piece.color == :white ? piece.current_row == 3 : piece.current_row == 4
  end

  def left_opponent_pawn?(from)
    piece = self[from]
    row, column = from
    left_opponent = board[row][column - 1]
    left_opponent.is_a?(Pawn) && left_opponent.color != piece.color
  end

  def right_opponent_pawn?(from)
    piece = self[from]
    row, column = from
    right_opponent = board[row][column + 1]
    right_opponent.is_a?(Pawn) && right_opponent.color != piece.color
  end

  def opponent_adjacent?(from)
    left_opponent_pawn?(from) || right_opponent_pawn?(from)
  end
end