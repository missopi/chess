# frozen_string_literal: true

require_relative '../lib/piece'

# class for creating chessboard
class Chessboard
  attr_reader :board

  def initialize
    @board = Array.new(8) { Array.new(8) }
  end

  def display_board
  end

  # setter method to place piece on board
  def []=(location, piece)
    row, column = location
    board[row][column] = piece
  end

  # setter method to retreive location of piece on board
  def [](location)
    row, column = location
    board[row][column]
  end

  def valid_location?(location)
    row, column = location

    row < board.length &&
      column < board.first.length &&
      row >= 0 &&
      column >= 0
  end
end
