# frozen_string_literal: true

require_relative '../lib/pieces'

describe Pawn do
  describe '#to_s' do
    subject(:pawn_white) { described_class.new(Chessboard.new, [0, 0], :white) }

    context 'When a white pawn is chosen' do
      it 'displays a white pawn icon on the board' do
        pawn = pawn_white.to_s
        expect(pawn).to eq(' ♙ ')
      end
    end

    subject(:pawn_black) { described_class.new(Chessboard.new, [0, 0], :black) }

    context 'When a black pawn is chosen' do
      it 'displays a black pawn icon on the board' do
        pawn = pawn_black.to_s
        expect(pawn).to eq(' ♟ ')
      end
    end
  end
end