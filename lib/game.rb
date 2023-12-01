# frozen_string_literal: true

require_relative '../lib/chessboard'
require_relative '../lib/pieces'
require_relative '../lib/player'
require_relative '../lib/render_board'
require_relative '../lib/serialize'
require_relative '../lib/input'

# class for the chess gameplay
class Game
  include Serialize
  include Input

  attr_reader :board, :color, :board_render
  attr_accessor :name

  def initialize(board, render_class, turn = 1)
    @board = board
    @board_render = render_class.new(board)
    @color = %i[white black]
    @turn = turn
  end

  def start_game
    puts "\n-------------------- Chess -----------------------\n\n"
    puts 'Instructions for how to play chess can be found at'
    puts "https://en.wikipedia.org/wiki/Chess.\n\n"
    puts "Do you wish to load a game you've already started? (Y/N)\n"
    input = gets.chomp.upcase
    puts "invalid choice. Please input 'Y' or 'N'." unless %w[Y N].include?(input)
    load_game if input == 'Y'
    @player_one = create_player(1)
    @player_two = create_player(2)
    play
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
    loop do
      current_player = assign_current_player(@turn)
      other_player = assign_current_player(@turn - 1)
      break if game_over?(current_player, other_player)

      player_turn(current_player)
      @turn += 1
    end
  end

  # Each player's turn
  def player_turn(player)
    puts "\nIt's #{player.name}'s turn"
    puts "#{player.color} you are currently in check." if board.check?(player.color)
    loop do
      board_render.render
      from_pos = player_input_from(player)
      to_pos = player_input_to
      move = board.move_piece(from_pos, to_pos)
      board.pawn_promotion(to_pos) unless move.nil?
      return move unless move.nil?
    end
  end

  # Choosing which piece to move on board
  def player_input_from(player)
    puts "\nChoose a #{player.color} piece to move or type 'O' for options: "
    loop do
      from = input_position
      return from if board[from].color == player.color

      puts 'Invalid choice.'
    end
  end

  # Choosing where to put each piece
  def player_input_to
    puts 'Choose a position to move to: '
    loop do
      to = input_position
      return to if board.valid_location?(to)

      puts 'Location chosen not on board.'
    end
  end

  def game_over?(current_player, other_player)
    if board.checkmate?(current_player.color)
      puts "Checkmate. #{other_player.name} wins!"
      exit
    end

    return unless board.stalemate?

    puts "It's a draw."
    exit
  end
end
