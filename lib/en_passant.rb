# frozen_string_literal: true

# Contains everything for en-passant move
module EnPassant
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

  def last_move_pawn_twostep?
    last_from = @history[@history.size - 2].first
    last_to = @history[@history.size - 2].last
    (last_to[0] - last_from[0]).abs == 2
  end

  def en_passant_performed?(from, to)
    return if @history.empty?

    opponent_adjacent?(from) && last_move_pawn_twostep?
  end
end