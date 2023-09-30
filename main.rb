# frozen_string_literal: true

require_relative '../chess/lib/chessboard'
require_relative '../chess/lib/pieces'
require_relative '../chess/lib/player'
require_relative '../chess/lib/render_board'
require_relative '../chess/lib/game'

cb = Chessboard.start_chess
chess = RenderBoard.new(cb)
chess.render
# b[[1, 3]].valid_moves
# b.move_piece([1, 3], [3, 3])
# chess.render

# board = Chessboard.start_chess
# game = Game.new(board, RenderBoard)
# game.play
