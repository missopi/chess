# frozen_string_literal: true

require_relative 'lib/chessboard'
require_relative 'lib/pieces'
require_relative 'lib/render_board'
require_relative 'lib/game'
require_relative 'lib/player'

cb = Chessboard.start_chess

def play_again?
  puts 'Do you want to play again? (Y/N)'
  answer = gets.chomp.upcase
  return answer == 'Y'
end

loop do
  Game.new(cb, RenderBoard).play
	unless play_again?
		puts 'Goodbye'
		break
	end
end


