# frozen_string_literal: true

require_relative '../lib/input'

describe Input do
  subject(:test_game) { Game.new(test_board, RenderBoard) }
  subject(:test_board) { Chessboard.start_chess }

  describe '#input_position' do
    before do
      allow(test_game).to receive(:gets).and_return('C3')
    end

    it 'converts player input to board coordinates' do
      input = test_game.input_position
      expect(input).to eq([5, 2])
    end
  end
end
