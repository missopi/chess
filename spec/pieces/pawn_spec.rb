# frozen_string_literal: true

require_relative '../../lib/pieces'

describe Pawn do
  describe '#one_step' do
    subject(:black_one) { described_class.new(Chessboard.new, [1, 3], :black) }

    context 'When the black pawn can move one step' do
      it 'returns one row higher' do
        one_step = black_one.one_step
        expect(one_step).to eq([2, 3])
      end
    end

    subject(:white_one) { described_class.new(Chessboard.new, [1, 3], :white) }

    context 'When the white pawn can move one step' do
      it 'returns one row lower' do
        one_step = white_one.one_step
        expect(one_step).to eq([0, 3])
      end
    end
  end

  describe '#two_step' do
    subject(:pawn_two) { described_class.new(Chessboard.new, [4, 4], :white) }

    context 'when the pawn can take two steps' do
      it 'returns the correct row to kove to' do
        two_step = pawn_two.two_step
        expect(two_step).to eq([2, 4])
      end
    end
  end

  describe '#diagonal_left' do
    subject(:pawn_diag_left) { described_class.new(Chessboard.new, [4, 4], :black) }

    context 'when the black pawn can capture an opponent to the left' do
      it 'returns the correct coords' do
        diag_left = pawn_diag_left.diagonal_left
        expect(diag_left).to eq([5, 3])
      end
    end
  end

  describe '#diagonal_right' do
    subject(:pawn_diag_right) { described_class.new(Chessboard.new, [4, 4], :white) }

    context 'when the white pawn can capture an opponent to the right' do
      it 'returns the correct coords' do
        diag_right = pawn_diag_right.diagonal_right
        expect(diag_right).to eq([3, 5])
      end
    end
  end

  describe '#en_passant_row?' do
    subject(:pawn_en_passant) { described_class.new(Chessboard.new, [3, 0], :white) }

    context 'when pawn is on correct row for en_passant' do
      it 'returns true' do
        en_passant = pawn_en_passant.en_passant_row?
        expect(en_passant).to be true
      end
    end

    subject(:pawn_not_passant) { described_class.new(Chessboard.new, [3, 0], :black) }

    context 'when pawn is not on the correct row for en_passant' do
      it 'returns false' do
        en_passant = pawn_not_passant.en_passant_row?
        expect(en_passant).to be false
      end
    end
  end

  describe '#left' do
    subject(:pawn_left) { described_class.new(Chessboard.new, [4, 4], :white) }

    context 'when checking for opponent to the left' do
      it 'returns the correct column' do
        left = pawn_left.left
        expect(left).to eq([4, 3])
      end
    end
  end

  describe '#right' do
    subject(:pawn_right) { described_class.new(Chessboard.new, [4, 4], :white) }

    context 'when checking for opponent to the right' do
      it 'returns the correct column' do
        right = pawn_right.right
        expect(right).to eq([4, 5])
      end
    end
  end

  describe '#first_move?' do
    subject(:pawn_first) { described_class.new(Chessboard.new, [1, 0], :black) }

    context 'When confirming the pawn is on the correct row for its first move' do
      it 'returns true' do
        first = pawn_first.first_move?
        expect(first).to be true
      end
    end
  end

  describe '#forward' do
    subject(:white_forward) { described_class.new(Chessboard.new, [0, 0], :white) }

    context 'when added to white pawn coords' do
      it 'returns -1' do
        forward = white_forward.forward
        expect(forward).to eq(-1)
      end
    end

    subject(:black_forward) { described_class.new(Chessboard.new, [0, 0], :black) }

    context 'when added to black pawn coords' do
      it 'returns 1' do
        forward = black_forward.forward
        expect(forward).to eq(1)
      end
    end
  end

  describe '#to_s' do
    subject(:pawn_white) { described_class.new(Chessboard.new, [0, 0], :white) }

    context 'When a white pawn is chosen' do
      it 'displays a white pawn icon on the board' do
        pawn = pawn_white.to_s
        expect(pawn).to eq(' ♙ ')
      end
    end

    subject(:pawn_black) { described_class.new(Chessboard.new, [0, 0], :black) }

    context 'When a black pawn is chosen' do
      it 'displays a black pawn icon on the board' do
        pawn = pawn_black.to_s
        expect(pawn).to eq(' ♟ ')
      end
    end
  end

  describe '#promotion?' do
    subject(:pawn_promotion) { described_class.new(Chessboard.new, [0, 0], :white) }

    context 'when a pawn in on the promotion row' do
      it 'returns true' do
        promo = pawn_promotion.promotion?
        expect(promo).to be true
      end
    end

    subject(:pawn_no_promotion) { described_class.new(Chessboard.new, [3, 0], :black) }

    context 'when a pawn is not on the promotion row' do
      it 'returns false' do
        promo = pawn_no_promotion.promotion?
        expect(promo).to be false
      end
    end
  end
end