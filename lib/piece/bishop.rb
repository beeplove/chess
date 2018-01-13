class Bishop < Piece
  def name
    "B"
  end

  def available_moves
    avilable_diagonal_moves
  end
end
