# frozen_string_literal: true

require_relative '../lib/chessboard'
require_relative '../lib/piece'
require_relative '../lib/player'
require_relative '../lib/render_board'
require_relative '../lib/game'

# cb = Chessboard.start_chess
# chess = RenderBoard.new(cb)
# chess.render
# b[[1, 3]].valid_moves
# b.move_piece([1, 3], [3, 3])
# chess.render

board = Chessboard.start_chess
game = Game.new(board, RenderBoard)
game.play
