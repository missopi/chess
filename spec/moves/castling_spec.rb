# frozen_string_literal: true

require_relative '../../lib/moves'

describe Castling do
  let(:test_board) { Chessboard.new }

  before do
    allow(test_board[[7, 4]] = King.new(test_board, [7, 4], :white))
    allow(test_board[[7, 0]] = Rook.new(test_board, [7, 0], :white))
    allow(test_board[[7, 7]] = Rook.new(test_board, [7, 7], :white))
  end

  describe '#king_at_start' do
    context 'when king is in the starting position' do
      it 'returns true' do
        result = test_board.king_at_start([7, 4])
        expect(result). to be true
      end
    end
  end

end

