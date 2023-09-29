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
        if board[[row, column]].nil?
          print '   '
        else
          print board[[row, column]]
        end
      end
    end
  end
end
