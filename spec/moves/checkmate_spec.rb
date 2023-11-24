# frozen_string_literal: true

require_relative '../../lib/moves'
require_relative '../../lib/chessboard'
require_relative '../../lib/pieces'

describe Checkmate do
  subject(:test_board) { Chessboard.new }

  describe '#checkmate?' do
    before do
      allow(test_board[[0, 0]] = King.new(test_board, [0, 0], :white))
      allow(test_board[[0, 4]] = King.new(test_board, [0, 4], :black))
    end

    context 'if it is checkmate' do
      before do
        allow(test_board[[0, 2]] = Rook.new(test_board, [0, 2], :black))
        allow(test_board[[2, 2]] = Queen.new(test_board, [2, 2], :black))
        allow(test_board[[2, 0]] = Rook.new(test_board, [2, 0], :black))
      end

      it 'returns true' do
        checkmate = test_board.checkmate?(:white)
        expect(checkmate).to be true
      end
    end

    context 'if it is not checkmate' do
      it 'returns false' do
        checkmate = test_board.checkmate?(:black)
        expect(checkmate).to be false
      end
    end
  end
end