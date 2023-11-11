# frozen_string_literal: true

require_relative '../lib/pieces'

describe King do
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
    subject(:king_queen) { described_class.new(Chessboard.new, [0, 4], :white) }

    context 'When doing a queenside castling' do
      it 'King moves two spaces left' do
        king_loc = king_queen.queen_castling
        expect(king_loc).to eq([0, 2])
      end
    end
  end

  describe '#king_castling' do
    subject(:king_king) { described_class.new(Chessboard.new, [0, 4], :white) }

    context 'When doing a queenside castling' do
      it 'King moves two spaces right' do
        king_loc = king_king.king_castling
        expect(king_loc).to eq([0, 6])
      end
    end
  end
end
