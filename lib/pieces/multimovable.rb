# frozen_string_literal: true

# module for piece that can move multiple spaces in one turn
module Multimovable
  def valid_moves
    moves = []
    possible_directions.each do |(dir_r, dir_c)|
      current_row, current_column = location
      loop do
        current_loc = [current_row += dir_r, current_column += dir_c]
        break unless board.valid_location?(current_loc)
        break unless board.empty_space?(current_loc) || opponent?(current_loc)

        if opponent?(current_loc)
          moves.push(current_loc)
          break
        end
        moves.push(current_loc)
      end
    end
    moves
  end
end
