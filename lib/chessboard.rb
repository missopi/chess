# frozen_string_literal: true

require_relative '../lib/piece'

# class for creating chessboard
class Chessboard
  attr_reader :board

  # pieces in starting positions on board
  def self.start_chess
    start = new
    8.times do |column|
      start[[1, column]] = Pawn.new(start, [1, column], :black)
      start[[6, column]] = Pawn.new(start, [6, column], :white)
    end
    [[0, :black], [7, :white]].each do |(row, color)|
      start[[row, 0]] = Rook.new(start, [row, 0], color)
      start[[row, 1]] = Knight.new(start, [row, 1], color)
      start[[row, 2]] = Bishop.new(start, [row, 2], color)
      start[[row, 3]] = Queen.new(start, [row, 3], color)
      start[[row, 4]] = King.new(start, [row, 4], color)
      start[[row, 5]] = Bishop.new(start, [row, 5], color)
      start[[row, 6]] = Knight.new(start, [row, 6], color)
      start[[row, 7]] = Rook.new(start, [row, 7], color)
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

  def empty_space?(location)
    row, column = location
    board[row][column].nil?
  end

  def valid_location?(location)
    row, column = location

    row < board.length &&
      column < board.first.length &&
      row >= 0 &&
      column >= 0
  end

  def move_piece(from, to)
    piece = self[from]
    if piece.valid_moves.include?(to) && valid_location?(to)
      self[from] = nil
      self[to] = piece
      piece.location = to
    else
      puts "#{to} is not a valid move for this piece."
      puts "Valid moves: #{piece.valid_moves}"
    end
  end
end
