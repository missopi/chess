require_relative '../lib/chessboard'
require_relative '../lib/piece'
require_relative '../lib/player'
require_relative '../lib/render_board'

cb = Chessboard.start_chess
chess = RenderBoard.new(cb)
chess.render