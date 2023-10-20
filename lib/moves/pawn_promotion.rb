# frozen_string_literal: true

# Contains everything for pawn promotion
module PawnPromotion
  def pawn_promotion(location)
    pawn = self[location]
    return unless pawn.is_a?(Pawn)
    return unless pawn.promotion_row == true

    loop do
      puts 'Which piece do you want to promote your pawn to?'
      puts '(R)ook, (B)ishop, k(N)ight or (Q)ueen?'
      choice = gets.chomp

      chosen_piece = {
        'R' => Rook.new(board, pawn.location, pawn.color),
        'B' => Bishop.new(board, pawn.location, pawn.color),
        'N' => Knight.new(board, pawn.location, pawn.color),
        'Q' => Queen.new(board, pawn.location, pawn.color)
      }

      if chosen_piece.key?(choice)
        self[location] = chosen_piece.fetch(choice)
        break
      else
        puts 'Invalid choice.'
      end
    end
  end
end