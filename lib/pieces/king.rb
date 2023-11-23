# frozen_string_literal: true

# subclass for king specific characteristics
class King < Piece
  def valid_moves
    moves = []
    possible_directions.each do |(dir_r, dir_c)|
      current_loc = [current_row + dir_r, current_column + dir_c]
      if board.valid_location?(current_loc)
        moves.push(current_loc) if board.empty_space?(current_loc)
        moves.push(current_loc) if opponent?(current_loc)
      end
    end
    moves.push(king_castling) if board.king_at_start(location)
    moves.push(queen_castling) if board.king_at_start(location)
    moves
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

  # once per game king can move 2 spaces and place rook on space skipped over
  def queen_castling
    [current_row, current_column - 2]
  end

  def king_castling
    [current_row, current_column + 2]
  end
end
