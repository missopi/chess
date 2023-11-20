# frozen_string_literal: true

require_relative '../../lib/pieces'

describe Queen do
  subject(:test_queen) { described_class.new(Chessboard.new, [0, 0], :white) }

  describe '#possible_directions' do
    it 'The Queen has 8 possible directions of movement' do
      directions = test_queen.possible_directions
      expect(directions).to eq([[0, 1], [1, 0], [-1, 0], [0, -1], [-1, 1], [1, 1], [-1, -1], [1, -1]])
    end
  end

  describe '#to_s' do
    context 'When a white queen is chosen' do
      it 'displays a white queen icon on the board' do
        queen_string = test_queen.to_s
        expect(queen_string).to eq(' ♕ ')
      end
    end

    context 'When a black queen is chosen' do
      subject(:queen_black) { described_class.new(Chessboard.new, [0, 0], :black) }

      it 'displays a black queen icon on the board' do
        queen_string = queen_black.to_s
        expect(queen_string).to eq(' ♛ ')
      end
    end
  end
end