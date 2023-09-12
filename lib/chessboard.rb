# frozen_string_literal: true

require_relative '../lib/piece'

# class for creating chessboard
class chessboard
  attr_accessor :board

  def initialize
    @board = Array.new(8) { Array.new(8) }
  end

  def display_board
  end

  def update_board
  end

  def move(from, to) end

  def check?
  end

  def checkmate?
  end

  def stalemate?
  end
end