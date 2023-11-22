# frozen_string_literal: true

require_relative '../../lib/moves'

describe EnPassant do
  subject(:test_board) { Chessboard.new }
  subject(:test_pawn) { Pawn.new(test_board, [4, 4], :white) }

  describe '#left_opponent_pawn?' do
    context 'when an opponent pawn it to the left' do
      before do
        allow(test_board[[4, 3]] = Pawn.new(test_board, [4, 3], :black))
      end

      it 'returns true' do
        result = test_board.left_opponent_pawn?([4, 4])
        expect(result).to be true
      end
    end
  end
end