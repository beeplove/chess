class Queen < Piece
  def name
    "Q"
  end

  def available_moves
    avilable_straight_moves + avilable_diagonal_moves
  end
end
