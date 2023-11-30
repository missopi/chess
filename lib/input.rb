# frozen_string_literal: true

require_relative 'game'

module Input
  def input_position
    position = gets.chomp.split(//)
    p position
    position.map do |part|
      part.upcase! if ('a'..'o').cover?(part)
      choose_option if part == 'O'
      part.gsub!(/[A-G]/) { |m| m.ord - 64 }
    end
    numbers = position.map { |num| num.to_i - 1 }
    numbers[0], numbers[1] = numbers[1], numbers[0]
    numbers[0] = 7 - numbers[0]
    p numbers
  end

  # Additional option choices
  def choose_option
    puts "Choose either 'save', 'help' or 'quit'.  To exit choices type 'N'."
    input = gets.chomp
    case input
    when 'help'
      puts 'Instructions for how to play chess can be found at'
      puts 'https://en.wikipedia.org/wiki/Chess.'
      choose_option
    when 'save'
      save_game(self)
      player_input_from(@current_player)
    when 'quit'
      board_render.render
      puts "\nGoodbye"
      exit
    when 'N'
      player_input_from(@current_player)
    else
      puts 'Invalid choice.'
    end
  end
end