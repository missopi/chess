# frozen_string_literal: true

require_relative '../lib/chessboard'
require_relative '../lib/piece'
require_relative '../lib/player'
require_relative '../lib/render_board'

# class for the chess gameplay
class Game
  attr_reader :board, :color, :board_render
  attr_accessor :name

  def initialize(board, render_class, turn = 1)
    @board = board
    @board_render = render_class.new(board)
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
    board_render.render
    @player_one = create_player(1)
    @player_two = create_player(2)
    loop do
      current_player = assign_current_player(@turn)
      player_turn(current_player)
      @turn += 1
      break if game_over?
    end
  end

  def player_turn(player)
    puts "It's #{player.name}'s turn"
    puts "Choose a #{player.color} piece to move: "
    from_pos = player_input_from(player)
    puts 'Choose a position to move to: '
    to_pos = player_input_to(player)
    board.move_piece(from_pos, to_pos)
    board_render.render
  end

  def player_input_from(player)
    loop do
      from = player.input_position
      return from if !board[from].nil? && board[from].color == player.color

      puts 'Invalid choice.'
    end
  end

  def player_input_to(player)
    loop do
      to = player.input_position
      return to if board.valid_location?(to) && piece.valid_moves

      puts 'Invalid choice.'
    end
  end

  def game_over?() end
end
