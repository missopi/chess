# frozen_string_literal: true

# class for creating chessboard
class chessboard
  attr_accessor :board

  def initialize
    @board = Array.new(8) { Array.new(8) }
  end

  def display_board
  end

  def update_board
  end
end