# frozen_string_literal: true

require_relative '../lib/chessboard'
require_relative '../lib/piece'
require_relative '../lib/player'
require_relative '../lib/render_board'

# cb = Chessboard.start_chess
# chess = RenderBoard.new(cb)
# chess.render

b = Chessboard.new
b[[2, 2]] = Queen.new(b, [2, 2], :black)
p b[[2, 2]].valid_moves
