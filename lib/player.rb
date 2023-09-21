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
      part.to_i - 1
    end
  end
end
