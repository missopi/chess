# frozen_string_literal: true

require_relative '../../lib/pieces'

describe Queen do
  describe '#to_s' do
    subject(:queen_white) { described_class.new(Chessboard.new, [0, 0], :white) }

    context 'When a white queen is chosen' do
      it 'displays a white queen icon on the board' do
        queen = queen_white.to_s
        expect(queen).to eq(' ♕ ')
      end
    end

    subject(:queen_black) { described_class.new(Chessboard.new, [0, 0], :black) }

    context 'When a black queen is chosen' do
      it 'displays a black queen icon on the board' do
        queen = queen_black.to_s
        expect(queen).to eq(' ♛ ')
      end
    end
  end
end