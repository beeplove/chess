class Rook < Piece
  def name
    "R"
  end

  def available_moves
    avilable_straight_moves
  end
end
