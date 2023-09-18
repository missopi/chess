# frozen_string_literal: true

require_relative '../lib/piece'

# class for creating chessboard
class Chessboard
  attr_reader :board

  def self.start_chess
    start = new
    8.times do |c|
      start[[1, c]] = Pawn.new(:black)
      start[[6, c]] = Pawn.new(:white)
    end
    [[0, :black], [7, :white]].each do |(row, color)|
      start[[row, 0]] = Rook.new(color)
      start[[row, 1]] = Knight.new(color)
      start[[row, 2]] = Bishop.new(color)
      start[[row, 3]] = Queen.new(color)
      start[[row, 4]] = King.new(color)
      start[[row, 5]] = Bishop.new(color)
      start[[row, 6]] = Knight.new(color)
      start[[row, 7]] = Rook.new(color)
    end
    start
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
