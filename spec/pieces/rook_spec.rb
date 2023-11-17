# frozen_string_literal: true

require_relative '../lib/pieces'

describe Rook do
  describe '#to_s' do
    subject(:rook_white) { described_class.new(Chessboard.new, [0, 0], :white) }

    context 'When a white rook is chosen' do
      it 'displays a white rook icon on the board' do
        rook = rook_white.to_s
        expect(rook).to eq(' ♖ ')
      end
    end

    subject(:rook_black) { described_class.new(Chessboard.new, [0, 0], :black) }

    context 'When a black rook is chosen' do
      it 'displays a black rook icon on the board' do
        rook = rook_black.to_s
        expect(rook).to eq(' ♜ ')
      end
    end
  end
end