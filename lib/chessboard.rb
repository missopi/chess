# frozen_string_literal: true

require_relative '../lib/pieces'
require_relative '../lib/en_passant'

# class for creating chessboard
class Chessboard
  include EnPassant
  include PawnPromotion
  attr_reader :board, :history

  # pieces in starting positions on board
  def self.start_chess
    start = new
    8.times do |column|
      start[[1, column]] = Pawn.new(start, [1, column], :black)
      start[[6, column]] = Pawn.new(start, [6, column], :white)
    end
    [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook].each_with_index do |klass, column|
      [[0, :black], [7, :white]].each do |(row, color)|
        start[[row, column]] = klass.new(start, [row, column], color)
      end
    end
    start
  end

  def initialize
    @board = Array.new(8) { Array.new(8, NoPiece.instance) }
    @history = []
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
    board[row][column] == NoPiece.instance
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
    board.flatten.reject { |piece| piece == NoPiece.instance }
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
    false
  end

  # method for checking if a certin king is in checkmate
  def checkmate?(color)
    return false unless check?(color) # must be in check

    king_moves = king(color).valid_moves
    moves = []
    pieces.reject { |piece| piece.color == color }.each do |piece|
      moves.push(piece.valid_moves)
    end
    moves.flatten!(1)
    return true if (king_moves - moves).empty?

    false
  end

  # method for stalemate - no possible moves for anyone
  def stalemate?
    available_moves = []
    pieces.each { |piece| available_moves.push(piece.valid_moves) }
    return true if available_moves.flatten.empty?

    false
  end

  # moving pieces from one location to another on the board
  def move_piece(from, to)
    piece = self[from]
    if piece.valid_moves.include?(to) && valid_location?(to)
      self[from] = NoPiece.instance
      self[to] = piece
      piece.location = to
      update_game_record(from, to)
      remove_enpassant_capture(to) if en_passant_performed?(from)
    else
      puts "Invalid move for this piece.\n"
    end
  end

  def remove_enpassant_capture(location)
    row, column = location
    board[row + 1][column] = NoPiece.instance
  end

  def update_game_record(from, to)
    history << [from, to]
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
