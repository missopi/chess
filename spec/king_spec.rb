# frozen_string_literal: true

require_relative '../lib/pieces/king'

describe King do
  describe '#valid_moves' do
    subject(:king_valid) { described_class.new }
  end

  describe '#possible_directions' do
    subject(:king_directions) { described_class.new }
  end

  describe '#to_s' do
    subject(:king_string) { described_class.new(Chessboard.new, [0, 0], :white) }

    context 'When a white king is chosen' do
      it 'displays a white king icon on the board' do
        king = king_string.to_s
        expect(king).to eq(' ♔ ')
      end
    end
  end

  describe '#queen_castling' do
    subject(:king_queen) { described_class.new }
  end

  describe '#king_castling' do
    subject(:king_king) { described_class.new }
  end
end
