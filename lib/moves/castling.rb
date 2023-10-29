# frozen_string_literal: true

# Contains everything for castling move
module Castling
  # actual castling move
  def do_castling_move(from, to)
    king_at_start(from)
    rook = rooks(from, to)
    castling_switch(to, rook)
  end

  # check king is in start position
  def king_at_start(from)
    king = self[from]
    king.is_a?(King)
    king.color == :white && from == [7, 4] || king.color == :black && from == [0, 4]
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

  def opponent_pieces(from)
    king = self[from]
    opponent_color = king.color == :white ? :black : :white
    opponent_pieces = pieces.select { |piece| piece.color == opponent_color }
    opponent_pieces
  end

  def opponent_valid_moves(from, to)
    opponent_valid_moves = []
    opponent_pieces = opponent_pieces(from)
    opponent_pieces.each { |opponent| opponent_valid_moves.push(opponent.valid_moves)}
    opponent_valid_moves.flatten(1)
  end

  def safe_route?(from, to)
    opponents = opponent_valid_moves(from, to)
    route = route(from, to)
    return true if (opponents & route).empty?
  end

  def route(from, to, route = [])
    route << from

    queenside = from[0] == 7 ? :white_queenside : :black_queenside
    kingside = from[0] == 7 ? :white_kingside : :black_kingside
    direction = from[1] > to[1] ? queenside : kingside

    route_coords = { 
      white_queenside: [7, 3],
      white_kingside: [7, 5],
      black_queenside: [0, 3],
      black_kingside: [0, 5]
    }
    
    route << route_coords.fetch(direction) if route_coords.key?(direction)
    route << to
    route
  end

  def castling_allowed?(to)
  end
end