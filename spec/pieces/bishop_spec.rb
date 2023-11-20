# frozen_string_literal: true

require_relative '../../lib/pieces'

describe Bishop do
  subject(:test_bishop) { described_class.new(Chessboard.new, [2, 2], :white) }

  describe '#possible_directions' do
    it 'The bishop has 4 possible directions of movement' do
      directions = test_bishop.possible_directions
      expect(directions).to eq([[-1, 1], [1, 1], [-1, -1], [1, -1]])
    end
  end

  describe '#to_s' do

    context 'When a white bishop is chosen' do
      it 'displays a white bishop icon on the board' do
        bishop = test_bishop.to_s
        expect(bishop).to eq(' ♗ ')
      end
    end

    context 'When a black bishop is chosen' do
      subject(:bishop_black) { described_class.new(Chessboard.new, [0, 0], :black) }

      it 'displays a black bishop icon on the board' do
        bishop = bishop_black.to_s
        expect(bishop).to eq(' ♝ ')
      end
    end
  end
end