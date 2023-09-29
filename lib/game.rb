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

  # Get players name and assign color
  def create_player(number)
    puts "\nPlayer #{number}, enter your name:"
    name = gets.chomp.capitalize
    player_color = color[number - 1]
    Player.new(name, player_color)
  end

  # Switch players after each turn
  def assign_current_player(turn)
    turn.odd? ? @player_one : @player_two
  end

  # Actual game play
  def play
    instructions
    @player_one = create_player(1)
    @player_two = create_player(2)
    loop do
      current_player = assign_current_player(@turn)
      player_turn(current_player)
      @turn += 1
      break if game_over?
    end
  end

  # Each player's turn
  def player_turn(player)
    # flip board
    puts "\nIt's #{player.name}'s turn"
    loop do
      board_render.render
      from_pos = player_input_from(player)
      to_pos = player_input_to(player)
      move = board.move_piece(from_pos, to_pos)
      return move unless move.nil?
    end
    board_render.render
  end

  # Choosing which piece to move on board
  def player_input_from(player)
    puts "\n\nChoose a #{player.color} piece to move: "
    loop do
      from = player.input_position
      return from if !board[from].nil? && board[from].color == player.color

      puts 'Invalid choice.'
    end
  end

  # Choosing where to put each piece
  def player_input_to(player)
    puts 'Choose a position to move to: '
    loop do
      to = player.input_position
      return to if board.valid_location?(to)

      puts 'Location chosen not on board.'
    end
  end

  def game_over?
    false
  end
end
