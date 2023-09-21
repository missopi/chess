# frozen_string_literal: true

# module for piece that can move one space in one turn
module Singlemovable
  def valid_moves
    moves = []
    possible_directions.each do |(dir_r, dir_c)|
      current_loc = [current_row + dir_r, current_column + dir_c]
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
      current_row, current_column = location
      loop do
        current_loc = [current_row += dir_r, current_column += dir_c]
        break unless board.valid_location?(current_loc)

        break unless board.empty_space?(current_loc)

        if opponent?(current_loc)
          moves.push(current_loc)
          break
        end
        moves.push(current_loc)
      end
    end
    moves
  end
end

# class for creating chess pieces
class Piece
  attr_reader :color, :board
  attr_accessor :location

  def initialize(board, location, color)
    @board = board
    @location = location
    @color = color
  end

  def opponent?(location)
    !board[location].nil? && board[location].color != color
  end

  def current_row
    location.first
  end

  def current_column
    location.last
  end
end

# subclass for pawn specific characteristics
class Pawn < Piece
  def valid_moves
    moves = []

    moves.push(one_step) if board.empty_space?(one_step)
    moves.push(diagonal_left) if opponent?(diagonal_left)
    moves.push(diagonal_right) if opponent?(diagonal_right)
    moves.push(two_step) if first_move? && board.empty_space?(one_step) && board.empty_space?(two_step)
    # moves.push(en_passant_left) if opponent?(right) and opponent first_move? == two_step
    # moves.push(en_passant_right) if opponent?(left) and opponent first_move? == two_step

    moves
  end

  def one_step
    [current_row + forward, current_column]
  end

  def two_step
    [current_row + (forward * 2), current_column]
  end

  def diagonal_left
    [current_row + forward, current_column + 1]
  end

  def diagonal_right
    [current_row + forward, current_column - 1]
  end

  # move to capture opponents pawn after their two step advance
  def en_passant_left
    [current_row - forward, current_column - 1]
  end

  def en_passant_right
    [current_row - forward, current_column + 1]
  end

  def left
    [current_row, current_column - 1]
  end

  def right
    [current_row, current_column + 1]
  end

  def first_move?
    color == :white && current_row == 6 ||
      color == :black && current_row == 1
  end

  def forward
    color == :white ? -1 : 1
  end

  # print icon of piece
  def to_s
    color == :white ? ' ♙ ' : ' ♟ '
  end

  # can upgrade to either queen, rook, bishop or knight when at opponents end
  def promotion?
    color == :white && current_row.zero? ||
      color == :black && current_row == 7
  end
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
