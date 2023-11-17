# frozen_string_literal: true

require_relative '../../lib/pieces'

describe Piece do
  describe '#current_row' do
    subject(:piece_row) { described_class.new(Chessboard.new, [5, 0], :white) }

    it "returns the piece's current row" do
      row = piece_row.current_row
      expect(row).to eq(5)
    end
  end

  describe '#current_column' do
    subject(:piece_column) { described_class.new(Chessboard.new, [0, 4], :white) }

    it "returns the piece's current column" do
      column = piece_column.current_column
      expect(column).to eq(4)
    end
  end

  describe '#opponent' do
    subject(:piece) {described_class.new(Chessboard.new, [0, 0], :white) }

    context 'when no opponent is at the chosen location' do
      it 'returns false' do
        opponent = piece.opponent?([0, 1])
        expect(opponent).to be false
      end
    end
  end
end
