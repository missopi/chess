# frozen_string_literal: true

require_relative '../lib/game'

# everything to do with player input
module Input
  def input_position
    position = gets.chomp.split(//)
    position.map do |part|
      part.upcase! if ('a'..'o').cover?(part)
      choose_option if part == 'O'
      part.gsub!(/[A-H]/) { |m| m.ord - 64 }
    end
    numbers = position.map { |num| num.to_i - 1 }
    numbers[0], numbers[1] = numbers[1], numbers[0]
    numbers[0] = 7 - numbers[0]
    numbers
  end

  # Additional option choices
  def choose_option
    puts "Choose either 'save' or 'quit'. Type 'N' to return to the game."
    input = gets.chomp
    case input
    when 'save'
      save_game
      play
    when 'quit'
      puts "\nGoodbye"
      exit
    when 'N'
      play
    else
      puts 'Invalid choice.'
      choose_option
    end
  end
end
