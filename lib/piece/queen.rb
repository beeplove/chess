class Queen < Piece
  def name
    "Q"
  end

  def potential_moves
    potential_straight_moves + potential_diagonal_moves
  end
end
