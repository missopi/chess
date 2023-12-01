# frozen_string_literal: true

require_relative 'game'

# everything to do with player input
module Input
  def input_position
    position = gets.chomp.split(//)
    position.map do |part|
      part.upcase! if ('a'..'o').cover?(part)
      choose_option if part == 'O'
      part.gsub!(/[A-G]/) { |m| m.ord - 64 }
    end
    numbers = position.map { |num| num.to_i - 1 }
    numbers[0], numbers[1] = numbers[1], numbers[0]
    numbers[0] = 7 - numbers[0]
    numbers
  end

  # Additional option choices
  def choose_option
    puts "Do you want to 'save' or 'quit'."
    input = gets.chomp
    case input
    when 'save'
      save_game(self)
    when 'quit'
      puts "\nGoodbye"
      exit
    else
      puts 'Invalid choice.'
      choose_option
    end
  end
end
