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

  # check if spaces adjacent to pawn are empty before so I know that twostep and adjacent pawn is new move
  def left_empty?(from)
    piece = self[from]
    row, column = from
    right = board[row][column + 1]
    right == NoPiece.instance
  end

  def right_empty?(from)
    piece = self[from]
    row, column = from
    left = board[row][column + 1]
    left == NoPiece.instance
  end

  def last_move_pawn_twostep?
    last_from = @history[@history.size - 2].first
    last_to = @history[@history.size - 2].last
    (last_to[0] - last_from[0]).abs == 2
  end

  def en_passant_performed?(from)
    return if @history.empty?

    opponent_adjacent?(from) && last_move_pawn_twostep?
  end
end
