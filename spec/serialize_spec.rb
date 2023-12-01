# frozen_string_literal: true

require_relative '../lib/serialize'

describe Serialize do
  subject(:test_game) { Game.new(test_board, RenderBoard) }
  subject(:test_board) { Chessboard.start_chess }

  before do
    allow(Dir).to receive(:mkdir)
    allow(test_game).to receive(:puts)
    allow(test_game).to receive(:gets).and_return('test')
    allow(File).to receive(:open)
  end

  describe '#create_filename' do
    context "If a file doesn't already exist with the same name" do
      it 'returns the filename' do
        game = test_game.create_filename
        expect(game).to eq('test')
      end
    end
  end

  describe '#save_game' do
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
    it 'returns false if game is not in folder' do
      game = test_game.file_exists?('sophie')
      expect(game).to be false
    end
  end

  describe '#display_saved_games' do
    xit 'puts list of saved games' do
    end
  end
end