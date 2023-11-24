# frozen_string_literal: true

require_relative '../../lib/pieces'

describe King do
  subject(:test_king) { described_class.new(Chessboard.new, [3, 3], :white) }

  describe '#possible_directions' do
    it 'The King has 8 possible directions of movement' do
      directions = test_king.possible_directions
      expect(directions).to eq([[0, 1], [1, 0], [-1, 0], [0, -1], [-1, 1], [1, 1], [-1, -1], [1, -1]])
    end
  end

  describe '#to_s' do
    context 'When a white king is chosen' do
      it 'displays a white king icon on the board' do
        king_string = test_king.to_s
        expect(king_string).to eq(' ♔ ')
      end
    end

    context 'When a black king is chosen' do
      subject(:king_black) { described_class.new(Chessboard.new, [0, 0], :black) }

      it 'displays a black king icon on the board' do
        king_string = king_black.to_s
        expect(king_string).to eq(' ♚ ')
      end
    end
  end

  subject(:castling) { described_class.new(Chessboard.new, [0, 4], :white) }

  describe 'castling_directions' do
    context 'When doing a castling' do
      it 'King moves either two spaces left or two steps right' do
        king_loc = castling.castling_directions
        expect(king_loc).to eq([[0, -2], [0, 2]])
      end
    end
  end

  describe '#king_castle_space' do
    context 'When doing a kingside castling' do
      it 'the space the castle moves to is one step right' do
        king_loc = castling.king_castle_space
        expect(king_loc).to eq([0, 5])
      end
    end
  end
end
