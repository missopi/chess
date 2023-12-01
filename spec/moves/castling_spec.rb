# frozen_string_literal: true

require_relative '../../lib/moves/castling'
require_relative '../../lib/chessboard'
require_relative '../../lib/pieces'

describe Castling do
  subject(:test_board) { Chessboard.new }

  before do
    allow(test_board[[7, 4]] = King.new(test_board, [7, 4], :white))
    allow(test_board[[7, 0]] = Rook.new(test_board, [7, 0], :white))
    allow(test_board[[7, 7]] = Rook.new(test_board, [7, 7], :white))
  end

  describe '#king_at_start' do
    context 'when king is in the starting position' do
      it 'returns true' do
        result = test_board.king_at_start([7, 4])
        expect(result).to be true
      end
    end
  end

  describe '#move_king' do
    context 'when a king moves' do
      it 'it moves on the board to the target position' do
        test_board.move_king([7, 4], [7, 6])
        expect(test_board[[7, 6]]).to be_a(King)
      end
    end
  end

  describe '#rook_at_start' do
    context 'when there is a rook in the start position' do
      it 'returns true' do
        result = test_board.rook_at_start([7, 4], [7, 6])
        expect(result).to be true
      end
    end
  end

  describe '#kingside_castling' do
    context 'after the king moves' do
      it 'moves the rook to its new position' do
        rook = Rook.new(test_board, [7, 7], :white)
        to = [7, 6]
        test_board.kingside_castling(to, rook)
        expect(test_board[[7, 5]]).to be_a(Rook)
      end
    end
  end

  describe '#queenside_castling' do
    context 'after the king moves' do
      it 'deletes the rook from its old position' do
        rook = Rook.new(test_board, [7, 0], :white)
        to = [7, 2]
        test_board.queenside_castling(to, rook)
        expect(test_board[[7, 0]]).to be_a(NoPiece)
      end
    end
  end

  describe '#route' do
    it 'returns the castling route taken by the king' do
      route = test_board.route([7, 4], [7, 6])
      expect(route).to eq([[7, 4], [7, 5], [7, 6]])
    end
  end
end
