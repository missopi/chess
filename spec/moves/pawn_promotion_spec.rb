# frozen_string_literal: true

require_relative '../../lib/moves'
require_relative '../../lib/chessboard'
require_relative '../../lib/pieces'

describe PawnPromotion do
  let(:test_board) { Chessboard.new }
  let(:test_pawn) { Pawn.new(test_board, [0, 0], :white) }

  describe '#pawn_promotion' do
    context 'when a pawn is on the promtion row' do
      it 'returns true' do
        pawn = test_pawn.promotion?
        expect(pawn).to be true
      end
    end

    context 'when the piece is a pawn' do
      it 'returns true' do
        pawn = test_pawn.is_a?(Pawn)
        expect(pawn).to be true
      end
    end

    context 'when the pawn is not on the promotion row' do
      let(:wrong_row) { Pawn.new(test_board, [3, 3], :white) }
      it 'returns false' do
        pawn = wrong_row.promotion?
        expect(pawn).to be false
      end
    end

    before do
      allow(test_board[[0, 0]] = test_pawn)
      allow(test_board).to receive(:puts)
      allow(test_board).to receive(:gets).and_return('R')
    end

    context 'when a pawn is eligible for promotion' do
      it 'is replaced by the player\'s choice of a bishop, knight, rook, or queen' do
        pawn_loc = test_pawn.location
        test_board.pawn_promotion(pawn_loc)
        expect(test_board[[0, 0]]).to be_a Rook
      end
    end
  end
end