# frozen_string_literal: true

# class for creating players
class Player
  attr_accessor :name, :color

  def initialize(name, color)
    @name = name
    @color = color
  end

  def input_position
    position = gets.chomp.split(//)
    position.map do |part|
      part.upcase! if ('a'..'g').cover?(part)
      part.gsub!(/[A-Z]/) { |m| m.ord - 64 }
    end
    numbers = position.map { |num| num.to_i - 1 }
    numbers[0], numbers[1] = numbers[1], numbers[0]
    numbers[0] = 7 - numbers[0]
    numbers
  end
end
