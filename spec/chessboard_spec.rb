# frozen_string_literal: true

require_relative '../lib/chessboard'

describe Chessboard do
  subject(:test_board) { described_class.new }

  describe '#start_chess' do
    subject(:test_start) { described_class.start_chess }

    context 'A new game of chess' do
      it 'has a Rook in coord [0, 0]' do
        rook = test_start[[0, 0]]
        expect(rook).to be_a(Rook)
      end

      it 'has a King in coord [7, 4]' do
        king = test_start[[7, 4]]
        expect(king).to be_a(King)
      end

      it 'has a black piece in coord [1, 3]' do
        black_piece = test_start[[1, 3]].color
        expect(black_piece).to be(:black)
      end
    end
  end

  describe '#initialize' do
    context 'A new board' do
      it 'has 8 rows' do
        rows = test_board.board.size
        expect(rows).to eq(8)
      end

      it 'has 8 columns' do
        columns = test_board.board[0].size
        expect(columns).to eq(8)
      end
    end
  end

  describe '#[]=' do
    context 'when a valid position is chosen' do
      it 'places a piece' do
        loc = [0, 3]
        test_board[loc] = 'KING'
        place_piece = test_board.board[0][3]
        expect(place_piece).to eq('KING')
      end
    end
  end

  describe '#[]' do
    context 'when a valid position is chosen' do
      before do
        loc = [3, 4]
        test_board[loc] = 'QUEEN'
      end

      it 'returns piece' do
        get = test_board[[3, 4]]
        expect(get).to eq('QUEEN')
      end
    end
  end

  describe '#valid_location' do
    context 'A location out of bounds' do
      it 'returns false' do
        out = [-1, 10]
        location = test_board.valid_location?(out)
        expect(location).to be false
      end
    end

    context 'A valid location' do
      it 'returns true' do
        valid = [5, 5]
        location = test_board.valid_location?(valid)
        expect(location).to be true
      end
    end
  end
end