# frozen_string_literal: true

require_relative '../lib/pieces'
require_relative '../lib/moves/en_passant'
require_relative '../lib/moves/pawn_promotion'
require_relative '../lib/moves/check'
require_relative '../lib/moves/checkmate'
require_relative '../lib/moves/castling'

# class for creating chessboard
class Chessboard
  include EnPassant
  include PawnPromotion
  include Check
  include Checkmate
  include Castling
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

  def find_pieces(color)
    pieces.select { |piece| piece.color == color }
  end

  # method to isolate king's location
  def king(color)
    pieces.find { |piece| piece.color == color && piece.is_a?(King) }
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
      self[to] = piece
      piece.location = to
      update_board(from, to)
      remove_piece(from)
      update_game_record(from, to)
    else
      puts "Invalid move for this piece.\n"
    end
  end

  def update_board(from, to)
    remove_enpassant_capture(to) if en_passant_performed?(from)
    do_castling_move(from, to) # if ...
  end

  def remove_piece(from)
    self[from] = NoPiece.instance
  end

  def update_game_record(from, to)
    history << [from, to]
  end
end
