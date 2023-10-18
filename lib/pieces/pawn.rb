# frozen_string_literal: true

# subclass for pawn specific characteristics
class Pawn < Piece
  def valid_moves
    moves = []

    moves.push(one_step) if board.empty_space?(one_step)
    moves.push(diagonal_left) if opponent?(diagonal_left)
    moves.push(diagonal_right) if opponent?(diagonal_right)
    moves.push(two_step) if first_move? && board.empty_space?(one_step) && board.empty_space?(two_step)
    moves.push(diagonal_left) if en_passant_row? && opponent_pawn?(left)
    moves.push(diagonal_right) if en_passant_row? && opponent_pawn?(right)
    moves
  end

  # pawn moving single space on board
  def one_step
    [current_row + forward, current_column]
  end

  # pawn moving two spaces (only available on first move)
  def two_step
    [current_row + (forward * 2), current_column]
  end

  # pawn capturing opponent on left
  def diagonal_left
    [current_row + forward, current_column - 1]
  end

  # pawn capturing opponent on right
  def diagonal_right
    [current_row + forward, current_column + 1]
  end

  # row possible to do en passant move
  def en_passant_row?
    color == :white && current_row == 3 || color == :black && current_row == 4
  end

  # Identifing space directly next to pawn
  def left
    [current_row, current_column - 1]
  end

  def right
    [current_row, current_column + 1]
  end

  # Ascertaining if the pawn is still in it's starting position
  def first_move?
    color == :white && current_row == 6 ||
      color == :black && current_row == 1
  end

  # Ascertaining which direction is forward on the board
  def forward
    color == :white ? -1 : 1
  end

  # print icon of piece
  def to_s
    color == :white ? ' ♙ ' : ' ♟ '
  end

  # can upgrade to either queen, rook, bishop or knight when at opponents end
  def promotion?
    color == :white && current_row.zero? ||
      color == :black && current_row == 7
  end
end
