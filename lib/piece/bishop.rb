class Bishop < Piece
  def name
    "B"
  end

  def potential_moves
    potential_diagonal_moves
  end
end
