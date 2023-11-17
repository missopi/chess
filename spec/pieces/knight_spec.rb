# frozen_string_literal: true

require_relative '../../lib/pieces'

describe Knight do
  describe '#to_s' do
    subject(:knight_white) { described_class.new(Chessboard.new, [0, 0], :white) }

    context 'When a white knight is chosen' do
      it 'displays a white knight icon on the board' do
        knight = knight_white.to_s
        expect(knight).to eq(' ♘ ')
      end
    end

    subject(:knight_black) { described_class.new(Chessboard.new, [0, 0], :black) }

    context 'When a black knight is chosen' do
      it 'displays a black knight icon on the board' do
        knight = knight_black.to_s
        expect(knight).to eq(' ♞ ')
      end
    end
  end
end