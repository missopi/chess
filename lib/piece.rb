# frozen_string_literal: true

# module for piece that can move one space in one turn
module Singlemovable
  def valid_moves
    moves = []
    possible_directions.each do |(dir_r, dir_c)|
      current_r, current_c = location
      current_loc = [current_r + dir_r, current_c + dir_c]
      moves.push(current_loc) if board.empty_space?(current_loc) && board.valid_location?(current_loc)
      moves.push(current_loc) if opponent?(current_loc)
    end
    moves
  end
end

# module for piece that can move multiple spaces in one turn
module Multimovable
  def valid_moves
    moves = []
    possible_directions.each do |(dir_r, dir_c)|
      current_r, current_c = location

      loop do
        current_loc = [current_r += dir_r, current_c += dir_c]
        break unless board.valid_location?(current_loc)

        moves.push(current_loc) if board.empty_space?(current_loc)
        if opponent?(current_loc)
          moves.push(current_loc)
          break
        end
      end
    end
    moves
  end
end

# class for creating chess pieces
class Piece
  attr_reader :color, :location, :board

  def initialize(board, location, color)
    @board = board
    @location = location
    @color = color
  end

  def opponent?(location)
    !board[location].nil? && board[location].color != color
  end
end

# subclass for pawn specific characteristics
class Pawn < Piece
  def valid_moves
  end

  def forward
    color == :white ? -1 : 1
  end

  def possible_directions
    [[0, 1]]
  end

  # print icon of piece
  def to_s
    color == :white ? ' ♙ ' : ' ♟ '
  end

  # can move 2 spaces to capture pawn after two step advance
  def en_passant
  end

  # can upgrade to either queen, rook, bishop or knight when at 8th row
  def promotion(piece) end
end

# subclass for rook specific characteristics
class Rook < Piece
  include Multimovable

  def possible_directions
    [
      [0, 1],
      [1, 0],
      [-1, 0],
      [0, -1]
    ]
  end

  # print icon of piece
  def to_s
    color == :white ? ' ♖ ' : ' ♜ '
  end
end

# subclass for bishop specific characteristics
class Bishop < Piece
  include Multimovable

  def possible_directions
    [
      [-1, 1],
      [1, 1],
      [-1, -1],
      [1, -1]
    ]
  end

  # print icon of piece
  def to_s
    color == :white ? ' ♗ ' : ' ♝ '
  end
end

# subclass for knight specific characteristics
class Knight < Piece
  include Singlemovable

  def possible_directions
    [
      [2, 1],
      [1, 2],
      [-1, -2],
      [-2, -1],
      [-1, 2],
      [-2, 1],
      [1, -2],
      [2, -1]
    ]
  end

  # print icon of piece
  def to_s
    color == :white ? ' ♘ ' : ' ♞ '
  end
end

# subclass for queen specific characteristics
class Queen < Piece
  include Multimovable

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
    color == :white ? ' ♕ ' : ' ♛ '
  end
end

# subclass for king specific characteristics
class King < Piece
  include Singlemovable

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
  def castling(location) end
end
