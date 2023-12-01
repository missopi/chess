# frozen_string_literal: true

require_relative '../lib/serialize'

describe Serialize do
  subject(:test_game) { Game.new(test_board, RenderBoard) }
  subject(:test_board) { Chessboard.start_chess }

  describe '#create_filename' do
    context "If a file doesn't already exist with the same name" do
      before do
        allow(test_game).to receive(:puts)
        allow(test_game).to receive(:gets).and_return('sophie')
      end

      it 'returns the filename' do
        game = test_game.create_filename
        expect(game).to eq('sophie')
      end
    end
  end

  describe '#save_game' do
    before do
      allow(Dir).to receive(:mkdir)
      allow(test_game).to receive(:puts)
      allow(test_game).to receive(:gets).and_return('test')
      allow(File).to receive(:open)
    end

    it 'sends message to create a directory' do
      expect(Dir).to receive(:mkdir).once
      test_game.save_game(test_game)
    end

    it 'sends message to create a file' do
      expect(File).to receive(:open).once
      test_game.save_game(test_game)
    end
  end

  describe '#saved_games' do
    xit 'returns saved games' do
    end
  end

  describe '#saved_games_exist?' do
    xit 'returns true if any saves are in folder' do
    end
  end

  describe '#display_saved_games' do
    xit 'puts list of saved games' do
    end
  end
end