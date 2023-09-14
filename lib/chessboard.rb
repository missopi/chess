# frozen_string_literal: true

require_relative '../lib/piece'

# class for creating chessboard
class Chessboard
  attr_reader :board

  def self.start_chess
    board = self.new
    8.times do |x|
      board[[1, x]] = Pawn.new(:black)
      board[[6, x]] = Pawn.new(:white)
    end

    board[[0, 0]] = Rook.new(:black)
    board[[0, 1]] = Knight.new(:black)
    board[[0, 2]] = Bishop.new(:black)
    board[[0, 3]] = Queen.new(:black)
    board[[0, 4]] = King.new(:black)
    board[[0, 5]] = Bishop.new(:black)
    board[[0, 6]] = Knight.new(:black)
    board[[0, 7]] = Rook.new(:black)
    board[[7, 0]] = Rook.new(:white)
    board[[7, 1]] = Knight.new(:white)
    board[[7, 2]] = Bishop.new(:white)
    board[[7, 3]] = Queen.new(:white)
    board[[7, 4]] = King.new(:white)
    board[[7, 5]] = Bishop.new(:white)
    board[[7, 6]] = Knight.new(:white)
    board[[7, 7]] = Rook.new(:white)
    board
  end

  def initialize
    @board = Array.new(8) { Array.new(8) }
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
