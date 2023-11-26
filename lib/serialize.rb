# frozen_string_literal: true

require 'yaml'

# class that handles everything to do with saving and loading the game
class Serialize
  def create_filename
  end

  def save_game(current_game)
    Dir.mkdir('saved_games') unless Dir.exist?('saved_games')

    filename = create_filename
    game = YAML.dump(current_game)
    File.open(File.join(Dir.pwd, "/saved_games/#{filename}.yaml"), 'w') { |file| file.write game }
    puts "Game saved in saved_games/#{filename}"
  end

  def load_game
    puts "No saves found.\n" unless saved_games_exist?

    display_saved_games
  end

  def saved_games
    DIR.entries('saved_games/')
       .map { |file| File.basename(file, '.yaml') }
  end

  def saved_games_exist?
    return false if !Dir.exist?('/saved_games') || Dir.empty?('/save_games')

    true
  end

  def display_saved_games
    puts "Saved games:\n\n"
    saved_games.each { |game| puts game }
  end

  def choose_game_to_load
  end

  def resume_game
  end
end