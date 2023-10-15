# frozen_string_literal: true

require_relative 'lib/chessboard'
require_relative 'lib/pieces'
require_relative 'lib/render_board'
require_relative 'lib/game'
require_relative 'lib/player'

cb = Chessboard.new

cb[[3, 0]] = Pawn.new(cb, [3, 0], :white)
cb[[1, 1]] = Pawn.new(cb, [1, 1], :black)
# cb[[2, 0]] = Rook.new(cb, [2, 0], :white)
# cb[[3, 3]] = Queen.new(cb, [3, 3], :white)
# cb[[0, 3]] = Queen.new(cb, [0, 3], :white)

chess = RenderBoard.new(cb)
chess.render
# cb.pawn_promotion([0, 0])
# puts cb.check?(:black)
puts 'valid moves'
p cb[[3, 0]].valid_moves
# puts cb.checkmate?(:white)
# puts cb.checkmate?(:black)

# puts cb.stalemate?
cb.move_piece([1, 1], [3, 1])
chess.render
cb.move_piece([3, 0], [2, 1])
# b = Chessboard.start_chess
# chess = RenderBoard.new(b)
chess.render
puts 'history'
p cb.history
# p cb.pieces_taken

# c = Piece.new(b, [1, 3], :white)

# g = Game.new(cb, RenderBoard)
# g.play
