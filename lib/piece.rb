# frozen_string_literal: true

# class for creating chess pieces
class Piece
  attr_reader :color, :location

  def initialize(color)
    @color = color
    @location = location
  end

  def can_leap?
    false
  end
end

# subclass for pawn specific characteristics
class Pawn < Piece
  def valid_moves(location)
    [[0, 1]]
  end

  # print icon of piece
  def to_s
    color == :white ? '♙' : '♟'
  end

  # can move 2 spaces to capture pawn after two step advance
  def en_passant(location) end

  # can upgrade to either queen, rook, bishop or knight when at 8th row
  def promotion(location, piece) end
end

# subclass for rook specific characteristics
class Rook < Piece
  def valid_moves(location)
    [
      [0, 1],
      [1, 0],
      [-1, 0],
      [0, -1]
    ]
  end

  # print icon of piece
  def to_s
    color == :white ? '♖' : '♜'
  end
end

# subclass for bishop specific characteristics
class Bishop < Piece
  def valid_moves(location)
    [
      [-1, 1],
      [1, 1],
      [-1, -1],
      [1, -1]
    ]
  end

  # print icon of piece
  def to_s
    color == :white ? '♗' : '♝'
  end
end

# subclass for knight specific characteristics
class Knight < Piece
  def valid_moves(location)
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
    color == :white ? '♘' : '♞'
  end

  def can_leap?
    true
  end
end

# subclass for queen specific characteristics
class Queen < Piece
  def valid_moves(location)
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
    color == :white ? '♕' : '♛'
  end
end

# subclass for king specific characteristics
class King < Piece
  def valid_moves(location)
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
    color == :white ? '♔' : '♚'
  end

  # once per game king can move 2 spaces and place rook on space skipped over
  def castling(current_position) end
end
