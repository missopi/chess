# frozen_string_literal: true

require_relative '../lib/chessboard'

# class to render visuals of board
class RenderBoard
  attr_reader :board

  def initialize(board)
    @board = board
  end

  # Render actual visual representation of board in console
  def render
    8.times do |row|
      puts ' '
      8.times do |column|
        print board[[row, column]].to_s
      end
    end
  end
end
