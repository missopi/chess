# frozen_string_literal: true

require_relative '../../lib/pieces'

describe Pawn do
  subject(:test_pawn) { described_class.new(Chessboard.new, [1, 3], :black) }

  describe '#one_step' do
    context 'When the black pawn can move one step' do
      it 'returns one row higher' do
        one_step = test_pawn.one_step
        expect(one_step).to eq([2, 3])
      end
    end

    context 'When the white pawn can move one step' do
      subject(:white_one) { described_class.new(Chessboard.new, [1, 3], :white) }

      it 'returns one row lower' do
        one_step = white_one.one_step
        expect(one_step).to eq([0, 3])
      end
    end
  end

  describe '#two_step' do
    context 'when the pawn can take two steps' do
      it 'returns the correct row to kove to' do
        two_step = test_pawn.two_step
        expect(two_step).to eq([3, 3])
      end
    end
  end

  describe '#diagonal_left' do
    context 'when the pawn can capture an opponent to the left' do
      it 'returns the correct coords' do
        diag_left = test_pawn.diagonal_left
        expect(diag_left).to eq([2, 2])
      end
    end
  end

  describe '#diagonal_right' do
    context 'when the pawn can capture an opponent to the right' do
      it 'returns the correct coords' do
        diag_right = test_pawn.diagonal_right
        expect(diag_right).to eq([2, 4])
      end
    end
  end

  describe '#en_passant_row?' do
    context 'when pawn is on correct row for en_passant' do
      subject(:pawn_en_passant) { described_class.new(Chessboard.new, [3, 0], :white) }

      it 'returns true' do
        en_passant = pawn_en_passant.en_passant_row?
        expect(en_passant).to be true
      end
    end

    context 'when pawn is not on the correct row for en_passant' do
      it 'returns false' do
        en_passant = test_pawn.en_passant_row?
        expect(en_passant).to be false
      end
    end
  end

  describe '#left' do
    context 'when checking for opponent to the left' do
      it 'returns the correct column' do
        left = test_pawn.left
        expect(left).to eq([1, 2])
      end
    end
  end

  describe '#right' do
    context 'when checking for opponent to the right' do
      it 'returns the correct column' do
        right = test_pawn.right
        expect(right).to eq([1, 4])
      end
    end
  end

  describe '#first_move?' do
    context 'When confirming the pawn is on the correct row for its first move' do
      it 'returns true' do
        first = test_pawn.first_move?
        expect(first).to be true
      end
    end
  end

  describe '#forward' do
    context 'when added to white pawn coords' do
      subject(:white_forward) { described_class.new(Chessboard.new, [0, 0], :white) }

      it 'returns -1' do
        forward = white_forward.forward
        expect(forward).to eq(-1)
      end
    end

    context 'when added to black pawn coords' do
      it 'returns 1' do
        forward = test_pawn.forward
        expect(forward).to eq(1)
      end
    end
  end

  describe '#to_s' do
    context 'When a white pawn is chosen' do
      subject(:pawn_white) { described_class.new(Chessboard.new, [0, 0], :white) }

      it 'displays a white pawn icon on the board' do
        pawn_string = pawn_white.to_s
        expect(pawn_string).to eq(' ♙ ')
      end
    end

    context 'When a black pawn is chosen' do
      it 'displays a black pawn icon on the board' do
        pawn_string = test_pawn.to_s
        expect(pawn_string).to eq(' ♟ ')
      end
    end
  end

  describe '#promotion?' do
    context 'when a pawn in on the promotion row' do
      subject(:pawn_promotion) { described_class.new(Chessboard.new, [0, 0], :white) }

      it 'returns true' do
        promo = pawn_promotion.promotion?
        expect(promo).to be true
      end
    end

    context 'when a pawn is not on the promotion row' do
      it 'returns false' do
        promo = test_pawn.promotion?
        expect(promo).to be false
      end
    end
  end
end