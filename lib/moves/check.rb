# frozen_string_literal: true

# Contains everything for check
module Check
  def check?(color)
    king = king(color)
    king_loc = king&.location
    pieces.reject { |piece| piece.color == color }.each do |piece|
      return true if piece.valid_moves.include?(king_loc)
    end
    false
  end
end
