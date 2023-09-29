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

  # method to show if space at location chosen is an empty space
  def empty_space?(location)
    row, column = location
    board[row][column].nil?
  end

  # method to show if location chosen is on the board
  def valid_location?(location)
    row, column = location

    row < board.length &&
      column < board.first.length &&
      row >= 0 &&
      column >= 0
  end

  # method to select only the pieces on the board and reject the empty spaces
  def pieces
    board.flatten.reject(&:nil?)
  end

  # method to isolate king's location
  def king(color)
    pieces.find { |piece| piece.color == color && piece.is_a?(King) }
  end

  # method for checking if the king of a certain color is in check
  def check?(color)
    king = king(color)
    king_loc = king.location
    pieces.reject { |piece| piece.color == color }.each do |piece|
      return true if piece.valid_moves.include?(king_loc)
    end
  end

  # method for checking if a certin king is in checkmate
  def checkmate?(color)
    return false unless check?(color) # must be in check

    king_check = king(color)
    pieces.reject { |piece| piece.color == color }.each do |piece|
      return true if piece.valid_moves.include?(king_check.valid_moves) || king_check.valid_moves.empty?
    end
    false
  end

  # moving pieces from one location to another on the board
  def move_piece(from, to)
    piece = self[from]
    if piece.valid_moves.include?(to) && valid_location?(to)
      self[from] = nil
      self[to] = piece
      piece.location = to
    else
      puts "Invalid move for this piece.\n"
    end
  end

  # Make duplicate of board to test safe moves for king during check
  def duplicate
    dup_board = Chessboard.new
    pieces.each do |piece|
      dup_piece = piece.class.new(dup_board, piece.location, piece.color)
      dup_board[dup_piece.location] = dup_piece
    end
    dup_board
  end
end
