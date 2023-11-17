# frozen_string_literal: true

require_relative '../../lib/pieces'

describe Bishop do
  describe '#to_s' do
    subject(:bishop_white) { described_class.new(Chessboard.new, [0, 0], :white) }

    context 'When a white bishop is chosen' do
      it 'displays a white bishop icon on the board' do
        bishop = bishop_white.to_s
        expect(bishop).to eq(' ♗ ')
      end
    end

    subject(:bishop_black) { described_class.new(Chessboard.new, [0, 0], :black) }

    context 'When a black bishop is chosen' do
      it 'displays a black bishop icon on the board' do
        bishop = bishop_black.to_s
        expect(bishop).to eq(' ♝ ')
      end
    end
  end
end