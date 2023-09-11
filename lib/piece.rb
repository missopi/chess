# frozen_string_literal: true

# class for creating chess pieces
class Piece
attr_accessor :color, :piece

  def initialize(color, piece)
    @color = color
    @piece = piece
  end

  def can_leap?
    return false
  end
end

# subclass for pawn specific characteristics
class Pawn < Piece
  def valid_moves(current_position)
  end

  # can move 2 spaces to capture pawn after two step advance
  def en_passant(current_position)
  end

  # can upgrade to either queen, rook, bishop or knight when at 8th row
  def promotion(current_position, piece)
  end
end

# subclass for rook specific characteristics
class Rook < Piece
  def valid_moves(current_position)
  end
end

# subclass for bishop specific characteristics
class Bishop < Piece
  def valid_moves(current_position)
  end
end

# subclass for knight specific characteristics
class Knight < Piece
  def valid_moves(current_position)
  end

  def can_leap?
    return true
  end
end

# subclass for queen specific characteristics
class Queen < Piece
  def valid_moves(current_position)
  end
end

# subclass for king specific characteristics
class King < Piece
  def valid_moves(current_position)
  end

  # once per game king can move 2 spaces and place rook on space skipped over
  def castling(current_position)
  end
end

