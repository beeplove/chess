class Pawn < Piece

  def potential_moves
    moves = []

    # TODO
    # - first ranked pawn can double march
    # - first ranked pawn can capture on left or right in certian scenario
    # - pawn can be promoted to any piece
    # - black pawn can't be on 8th row
    # - white pawn can't be on 1st row

    # black pawn's row decrease
    moves << [r_idx - 1, c_idx] if black?

    # white pawn's row increase
    moves << [r_idx + 1, c_idx] if white?

    moves
  end
end
