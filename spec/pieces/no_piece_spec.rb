# frozen_string_literal: true

require_relative '../../lib/pieces'

describe NoPiece do
  describe '#to_s' do
    subject(:no_piece_string) { described_class.instance }

    context 'When there is no piece on the board' do
      it 'displays a blank space' do
        no_piece = no_piece_string.to_s
        expect(no_piece).to be nil
      end
    end
  end
end