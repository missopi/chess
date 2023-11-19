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
    subject(:piece) { described_class.new(board, [0, 0], :white) }
    subject(:board) { Chessboard.new }

    context 'when an opponent piece is at the chosen location' do
      before do
        allow(board[[3, 3]] = Pawn.new(board, [3, 3], :black))
      end
      it 'returns true' do
        opponent = piece.opponent?([3, 3])
        expect(opponent).to be true
      end
    end
  end
end
