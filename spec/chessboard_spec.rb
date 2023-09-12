# frozen_string_literal: true

require_relative '../lib/chessboard'

describe Chessboard do
  describe '#initialize' do
    subject(:new_board) { described_class.new }

    context 'A new board' do
      it 'has 8 rows' do
        rows = new_board.board.size
        expect(rows).to eq(8)
      end

      it 'has 8 columns' do
        columns = new_board.board[0].size
        expect(columns).to eq(8)
      end
    end
  end

  describe '#[]=' do
    subject(:place_piece) { described_class.new }
  end

  describe '#[]' do
    subject(:get_piece) { described_class.new }
  end

  describe '#valid_location' do
    subject(:valid_board) { described_class.new }

    context 'A location out of bounds' do
      it 'returns false' do
        out = [-1, 10]
        location = valid_board.valid_location?(out)
        expect(location).to be false
      end
    end

    context 'A valid location' do
      it 'returns true' do
        valid = [5, 5]
        location = valid_board.valid_location?(valid)
        expect(location).to be true
      end
    end
  end
end