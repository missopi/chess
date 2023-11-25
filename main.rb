# frozen_string_literal: true

require_relative 'lib/chessboard'
require_relative 'lib/pieces'
require_relative 'lib/render_board'
require_relative 'lib/game'
require_relative 'lib/player'

cb = Chessboard.start_chess
g = Game.new(cb, RenderBoard)
g.play
