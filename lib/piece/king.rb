class King < Piece
  def name
    "K"
  end

  def potential_moves
    potential_diagonal_moves(true)
  end
end
