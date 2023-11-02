# frozen_string_literal: true

# Contains everything for castling move
module Castling
  # actual castling move
  def do_castling_move(from, to)
    rook = rooks(from, to)
    castling_switch(to, rook)
  end

  # check king is in start position
  def king_at_start(from)
    king = self[from]
    king.is_a?(King)
    king.color == :white && from == [7, 4] || king.color == :black && from == [0, 4]
  end

  def rook_at_start(from, to)
    rook = rooks(from, to)
    rook.location[1] == 0 || 7 ? true : false
  end

  # find and identify chosen rook to do castling with
  def rooks(from, to)
    king = self[from]
    rooks = board.flatten.find_all do |piece|
      piece.is_a?(Rook) && piece.color == king.color
    end
    identify_rook(rooks, to)
  end

  def identify_rook(rooks, to)
    row, column = to
    if column == 6
      rooks.find { |rook| rook if rook.location[1] == 7 }
    elsif column == 2
      rooks.find { |rook| rook if rook.location[1] == 0 }
    end
  end

  def move_king(from, to)
    king = self[from]
    self[to] = king
    king.location = to
  end

  # king is on nearside of rook in comparison to queen
  def kingside_castling(to, rook)
    row, column = to
    board[row][column - 1] = rook # move rook
    board[row][column + 1] = NoPiece.instance # delete old rook
  end

  # king is on farside of rook in comparison to queen
  def queenside_castling(to, rook)
    row, column = to
    board[row][column + 1] = rook
    board[row][column - 2] = NoPiece.instance 
  end

  def castling_switch(to, rook)
    row, column = to
    if column == 6
      kingside_castling(to, rook)
    elsif column == 2
      queenside_castling(to, rook)
    end
  end

  # All opponent pieces currently on board
  def opponent_pieces(from)
    king = self[from]
    opponent_color = king.color == :white ? :black : :white
    opponent_pieces = pieces.select { |piece| piece.color == opponent_color }
    opponent_pieces
  end

  # All valid moves able to be taken by opponent pieces on board
  def opponent_valid_moves(from)
    opponent_valid_moves = []
    opponent_pieces = opponent_pieces(from)
    opponent_pieces.each { |opponent| opponent_valid_moves.push(opponent.valid_moves)}
    opponent_valid_moves.flatten(1)
  end

  # Is the move safe to do? No locations are reachable by opponent
  def safe_route?(from, to)
    opponents = opponent_valid_moves(from)
    route = route(from, to)
    return true if (opponents & route).empty?

    false
  end

  # Create array of route to be taken by king
  def route(from, to, route = [])
    piece = self[from]
    route << [from]
    queenside = piece.color == :white ? :white_queenside : :black_queenside
    kingside = piece.color == :white ? :white_kingside : :black_kingside
    direction = from[1] > to[1] ? queenside : kingside

    route_coords = { 
      white_queenside: [[7, 3], [7, 2]],
      white_kingside: [[7, 5], [7, 6]],
      black_queenside: [[0, 3], [0, 2]],
      black_kingside: [[0, 5], [0, 6]]
    }
    
    route << route_coords.fetch(direction) if route_coords.key?(direction)
    route.flatten(1)
  end

  def castling_allowed?(from, to)
    safe_route?(from, to) && king_at_start(from) && rook_at_start(from, to)
  end
end