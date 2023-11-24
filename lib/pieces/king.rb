# frozen_string_literal: true

# subclass for king specific characteristics
class King < Piece
  def valid_moves
    moves = []
    possible_directions.each do |(dir_r, dir_c)|
      move_loc = [current_row + dir_r, current_column + dir_c]
      if board.valid_location?(move_loc)
        moves.push(move_loc) if board.empty_space?(move_loc)
        moves.push(move_loc) if opponent?(move_loc)
      end
    end
    moves << castling_moves
    moves
  end

  def castling_moves
    castling_moves = []
    castling_directions.each do |(dir_r, dir_c)|
      current_loc = [current_row, current_column]
      move_loc = [current_row + dir_r, current_column + dir_c]
      if board.king_at_start(current_loc)
        castling_moves.push(move_loc) if board.empty_space?(move_loc) && board.empty_space?(king_castle_space)
        castling_moves.push(move_loc) if board.empty_space?(move_loc) && board.empty_space?(queen_castle_space)
      end
    end
    castling_moves.flatten(1)
  end

  def castling_directions
    [
      [0, -2],
      [0, 2]
    ]
  end

  def possible_directions
    [
      [0, 1],
      [1, 0],
      [-1, 0],
      [0, -1],
      [-1, 1],
      [1, 1],
      [-1, -1],
      [1, -1]
    ]
  end

  # print icon of piece
  def to_s
    color == :white ? ' ♔ ' : ' ♚ '
  end

  def queen_castle_space
    [current_row, current_column - 1]
  end

  def king_castle_space
    [current_row, current_column + 1]
  end
end
