# frozen_string_literal: true

require_relative '../../lib/moves'
require_relative '../../lib/chessboard'
require_relative '../../lib/pieces'

describe Check do
  subject(:test_board) { Chessboard.new }

  describe '#check?' do
    before do
      allow(test_board[[0, 0]] = King.new(test_board, [0, 0], :white))
      allow(test_board[[0, 4]] = King.new(test_board, [0, 4], :black))
    end

    context 'if the king is in check' do
      before do
        allow(test_board[[0, 2]] = Rook.new(test_board, [0, 2], :black))
      end

      it 'returns true' do
        check = test_board.check?(:white)
        expect(check).to be true
      end
    end

    context 'if the king is not in check' do
      it 'returns false' do
        check = test_board.check?(:black)
        expect(check).to be false
      end
    end
  end
end