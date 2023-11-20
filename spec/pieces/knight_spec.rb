# frozen_string_literal: true

require_relative '../../lib/pieces'

describe Knight do
  subject(:test_knight) { described_class.new(Chessboard.new, [0, 0], :white) }

  describe '#possible_directions' do
    it 'The Knight has 8 possible directions of movement' do
      directions = test_knight.possible_directions
      expect(directions).to eq([[2, 1], [1, 2], [-1, -2], [-2, -1], [-1, 2], [-2, 1], [1, -2], [2, -1]])
    end
  end

  describe '#to_s' do
    context 'When a white knight is chosen' do
      it 'displays a white knight icon on the board' do
        knight_string = test_knight.to_s
        expect(knight_string).to eq(' ♘ ')
      end
    end

    context 'When a black knight is chosen' do
      subject(:knight_black) { described_class.new(Chessboard.new, [0, 0], :black) }

      it 'displays a black knight icon on the board' do
        knight_string = knight_black.to_s
        expect(knight_string).to eq(' ♞ ')
      end
    end
  end
end