# frozen_string_literal: true

require_relative '../lib/chessboard'
require_relative '../lib/piece'
require_relative '../lib/player'
require_relative '../lib/render_board'

# class for the chess gameplay
class Game
  attr_reader :board, :color
  attr_accessor :name

  def initialize(board, turn = 1)
    @board = board
    @color = %i[white black]
    @turn = turn
  end

  def instructions
    puts "\n"
    puts '-------------------- Chess -----------------------'
    puts "\n"
    puts 'Instructions for how to play chess can be found at'
    puts 'https://en.wikipedia.org/wiki/Chess.'
    puts "\n"
  end

  def create_player(number)
    puts "\nPlayer #{number}, enter your name:"
    name = gets.chomp.capitalize
    player_color = color[number - 1]
    Player.new(name, player_color)
  end

  def assign_current_player(turn)
    turn.odd? ? @player_one : @player_two
  end

  def play
    instructions
    @player_one = create_player(1)
    @player_two = create_player(2)
    loop do
      current_player = assign_current_player(@turn)
      player_turn(current_player)
      @turn += 1
      # break when game_over?
    end
  end

  def player_turn(player)
    puts "It's #{player.name}'s turn"
    puts "Choose a #{player.color} piece to move: "
    player_input(player)
  end

  def player_input(player)
    player.input_position
  end

  def valid_move?(move) end

  def space_available?(move) end

  def ask_promotion_piece() end

  def make_move(move) end

  def game_over?() end
end

