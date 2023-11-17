# frozen_string_literal: true

require_relative '../lib/pieces'

describe Piece do
  describe '#current_row' do
    subject(:piece_row) { described_class.new(Chessboard.new, [0, 0], :white) }

    it "returns the piece's current row" do
      row = piece_row.current_row
      expect(row).to eq(0)
    end
  end
end
