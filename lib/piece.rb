
class Piece
  attr_reader :r_idx, :c_idx

  def initialize r_idx, c_idx
    @r_idx = r_idx
    @c_idx = c_idx
  end

  # TODO: dummy method, may not be necessary
  def name
    "x"
  end

  def available_moves
    # TODO
    # - raise a more specific error
    raise ArgumentError, "class Piece is an abstraction class, please create subclass from Piece for your piece and implement available_moves"
  end

  def avilable_straight_moves
    moves = []

    # Possible moves
    # - r_idx fixed, c_idx increment/decrement
    # - c_idx fixed, r_idx increment/decrement

    0.upto(Board::WIDTH - 1) { |i|
      moves << [r_idx, i] if i != c_idx
    }

    0.upto(Board::WIDTH - 1) { |i|
      moves << [i, c_idx] if i != r_idx
    }

    moves
  end
end
