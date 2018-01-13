class Rook < Piece
  def name
    "R"
  end

  def potential_moves
    potential_straight_moves
  end
end
