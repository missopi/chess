require_relative '../lib/chessboard'
require_relative '../lib/piece'
require_relative '../lib/player'
require_relative '../lib/render_board'

cb = Chessboard.new
chess = RenderBoard.new(cb)
chess.render