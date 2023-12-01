# frozen_string_literal: true

require 'yaml'

# handles everything to do with saving and loading the game
module Serialize
  def create_filename
    puts 'Enter a name for your saved game.'
    name = gets.chomp
    while file_exists?(name)
      return name if overwrite?

      name = gets.chomp
    end
    name
  end

  def file_exists?(filename)
    File.exist?(File.join(Dir.pwd, "/saved_games/#{filename}.yaml"))
  end

  def overwrite?
    puts 'Do you want to overwrite the file? (Y/N)'
    answer = gets[0].upcase
    until %w[Y N].include? answer
      puts 'Invalid choice. Do you want to overwrite the file? (Y/N)'
      answer = gets[0].upcase
    end

    true if answer == 'Y'
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
    filename = choose_game_to_load
    YAML.safe_load(File.read("./saved_games/#{filename}.yaml"))
  end

  def saved_games
    Dir.entries('saved_games/')
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
    puts "\nPlease choose which game you'd like to load or 'exit' menu:\n\n"

    saved_games.each { |game| puts game }
    puts "\n\n"

    filename = gets.downcase.chomp
    Game.new(Chessboard.start_chess, RenderBoard).play if filename == 'exit'

    until saved_games.include?(filename)
      puts "#{filename} does not exist"
      choose_game_to_load
    end
    filename
  end
end
