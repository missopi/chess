# frozen_string_literal: true

require_relative '../lib/chessboard'

class RenderBoard
  attr_reader :board

  def initialize(board)
    @board = board
  end

  def render
    8.times do |row|
      puts ' '
      8.times do |column|
        print ' x '
      end
    end
    puts ' '
  end

end

render = RenderBoard.new(Chessboard.new)
render.render