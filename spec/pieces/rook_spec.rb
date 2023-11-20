# frozen_string_literal: true

require_relative '../../lib/pieces'

describe Rook do
  subject(:test_rook) { described_class.new(Chessboard.new, [0, 0], :white) }

  describe '#possible_directions' do
    it 'The Rook has 4 possible directions of movement' do
      directions = test_rook.possible_directions
      expect(directions).to eq([[0, 1], [1, 0], [-1, 0], [0, -1]])
    end
  end

  describe '#to_s' do
    context 'When a white rook is chosen' do
      it 'displays a white rook icon on the board' do
        rook_string = test_rook.to_s
        expect(rook_string).to eq(' ♖ ')
      end
    end

    context 'When a black rook is chosen' do
      subject(:rook_black) { described_class.new(Chessboard.new, [0, 0], :black) }

      it 'displays a black rook icon on the board' do
        rook_string = rook_black.to_s
        expect(rook_string).to eq(' ♜ ')
      end
    end
  end
end