# frozen_string_literal: true

require_relative '../lib/game'

describe Game do
  subject(:test_game) { described_class.new(test_board, RenderBoard) }
  subject(:test_board) { Chessboard.start_chess }

  describe '#create_player' do
    context 'at the start of play' do
      before do
        allow(test_game).to receive(:puts)
        allow(test_game).to receive(:gets).and_return('Sophie')
      end

      it 'creates a new player' do
        test_player = test_game.create_player(1)
        expect(test_player.name).to eq('Sophie')
      end

      it 'assigns a player a colour' do
        test_player = test_game.create_player(1)
        expect(test_player.color).to eq(:white)
      end
    end
  end

  describe '#assign_current_player' do
  end


end