# frozen_string_literal: true

# module for piece that can move one space in one turn
module Singlemovable
  def valid_moves
    moves = []
    possible_directions.each do |(dir_r, dir_c)|
      current_loc = [current_row + dir_r, current_column + dir_c]
      if board.valid_location?(current_loc)
        moves.push(current_loc) if board.empty_space?(current_loc)
        moves.push(current_loc) if opponent?(current_loc)
      end
    end
    moves
  end
end