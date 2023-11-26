# frozen_string_literal: true

# class that handles everything to do with saving and loading the game
class Serialize
  def create_filename
  end

  def save_game
    Dir.mkdir('saved_games') unless Dir.exist?('saved_games')

    
  end

  def load_game
  end

  def saved_games
  end

  def display_saved_games
  end

  def choose_game_to_load
  end

  def resume_game
  end
end