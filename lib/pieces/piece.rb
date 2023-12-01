# frozen_string_literal: true

# class for creating chess pieces
class Piece
  attr_reader :color, :board, :previous_location
  attr_accessor :location

  def initialize(board, location, color)
    @board = board
    @location = location
    @color = color
  end

  def opponent?(location)
    board[location]&.color != color && board[location].is_a?(Piece)
  end

  def opponent_pawn?(location)
    board[location]&.color != color && board[location].is_a?(Pawn)
  end

  def current_row
    location.first
  end

  def current_column
    location.last
  end

  def move(to)
    @previous_location = location
    @location = to
  end
end
