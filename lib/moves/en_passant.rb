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

  # Check that opponent pawn is in space adjacent to current player's pawn
  def opponent_pawn_adjacent?(from)
    left_opponent_pawn?(from) || right_opponent_pawn?(from)
  end

  # Check that last move made by opponent was a two step pawn advance
  def last_move_pawn_twostep?
    last_from = @history[@history.size - 2].first
    last_to = @history[@history.size - 2].last
    (last_to[0] - last_from[0]).abs == 2
  end

  # Check that last move made by opponent ends adjacent to current player's pawn
  def last_move_adjacent?(from)
    from = @history.last.first
    last_to = @history[@history.size - 2].last
    row, column = last_to
    (last_to[1] - from[1]).abs == 1 || (last_to[1] + from[1]).abs == 1
  end

  def en_passant_performed?(from)
    return if @history.empty?

    opponent_pawn_adjacent?(from) && last_move_pawn_twostep? && last_move_adjacent?(from)
  end

  def remove_enpassant_capture(location)
    piece = self[location]
    row, column = location
    piece.color == :white ? board[row + 1][column] = NoPiece.instance : board[row - 1][column] = NoPiece.instance
  end
end
