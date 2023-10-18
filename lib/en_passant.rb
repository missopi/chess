# frozen_string_literal: true

# Contains everything for en-passant move
module EnPassant
  def correct_row(from)
    piece = self[from]
    piece.color == :white ? piece.current_row == 3 : piece.current_row == 4
  end

  
end