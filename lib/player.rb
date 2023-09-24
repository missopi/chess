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
      part.upcase!.gsub!(/[A-Z]/) { |m| m.ord - 64 } if ('a'..'g').cover?(part) || ('A'..'G').cover?(part)
    end
    numbers = position.map { |num| num.to_i - 1 }
    numbers[0], numbers[1] = numbers[1], numbers[0]
    if (numbers[0]).zero?
      numbers[0] = 7
    elsif numbers[0] == 1
      numbers[0] = 6
    elsif numbers[0] == 2
      numbers[0] = 5
    elsif numbers[0] == 3
      numbers[0] = 4
    elsif numbers[0] == 4
      numbers[0] = 3
    elsif numbers[0] == 5
      numbers[0] = 2
    elsif numbers[0] == 6
      numbers[0] = 1
    elsif numbers[0] == 7
      numbers[0] = 0
    end
    numbers
  end
end
