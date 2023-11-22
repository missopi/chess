# frozen_string_literal: true

require_relative '../../lib/moves'
require_relative '../../lib/chessboard'
require_relative '../../lib/pieces'

describe EnPassant do
  subject(:test_board) { Chessboard.new }
  subject(:test_pawn) { Pawn.new(test_board, [4, 4], :white) }

  describe '#left_opponent_pawn?' do
    context 'when an opponent pawn it to the left' do
      before do
        allow(test_board[[4, 3]] = Pawn.new(test_board, [4, 3], :black))
      end

      it 'returns true' do
        result = test_board.left_opponent_pawn?([4, 4])
        expect(result).to be true
      end
    end
  end

  describe '#right_opponent_pawn?' do
    context 'when an opponent pawn it to the right' do
      before do
        allow(test_board[[4, 5]] = Pawn.new(test_board, [4, 5], :black))
      end

      it 'returns true' do
        result = test_board.right_opponent_pawn?([4, 4])
        expect(result).to be true
      end
    end
  end

  describe '#opponent_pawn_adjacent?' do
    context 'when an opponent pawn is on either side' do
      before do
        allow(test_board[[4, 3]] = Pawn.new(test_board, [4, 3], :black))
      end

      it 'returns true' do
        result = test_board.opponent_pawn_adjacent?([4, 4])
        expect(result).to be true
      end
    end

    context 'when no opponent pawns are adjacent' do
      it 'returns false' do
        result = test_board.opponent_pawn_adjacent?([4, 4])
        expect(result).to be false
      end
    end
  end

  describe '#remove_enpassant_capture' do
    context 'after en_passant is performed' do
      before do
        allow(test_board[[3, 3]] = Pawn.new(test_board, [3, 3], :white))
        allow(test_board[[4, 3]] = Pawn.new(test_board, [4, 3], :black))
      end

      it 'removes opponent piece from the board' do
        result = test_board.remove_enpassant_capture([3, 3])
        expect(test_board[[4, 3]]).to eq(NoPiece.instance)
      end
    end
  end
end