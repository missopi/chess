# frozen_string_literal: true

require_relative '../lib/pieces'

describe Bishop do
  describe '#to_s' do
    subject(:bishop_string) { described_class.new(Chessboard.new, [0, 0], :white) }

    context 'When a white bishop is chosen' do
      it 'displays a white bishop icon on the board' do
        bishop = bishop_string.to_s
        expect(bishop).to eq(' ♗ ')
      end
    end
  end
end