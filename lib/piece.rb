
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

  def potential_moves
    # TODO
    # - raise a more specific error
    raise ArgumentError, "class Piece is an abstraction class, please create subclass from Piece for your piece and implement potential_moves"
  end

  def potential_straight_moves
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

  #
  # To be used by King, Queen and Bishop
  # when used by King there should have limit passed as param with value 1
  #
  # Parameter
  # - limit
  def potential_diagonal_moves is_king=false
    moves = []

    # Possible moves
    # - all possible combination of increment/decrement of r_idx/c_idx

    r_min = is_king ? (r_idx - 1 >= 0 ? r_idx - 1 : r_idx) : 0
    c_min = is_king ? (c_idx - 1 >= 0 ? c_idx - 1 : c_idx) : 0
    r_max = is_king ? (r_idx + 1 <= 7 ? r_idx + 1 : r_idx) : Board::WIDTH - 1
    c_max = is_king ? (c_idx + 1 <= 7 ? c_idx + 1 : c_idx) : Board::WIDTH - 1

    # top-right: row-decrement, column-increment [4, 5] [3, 6]
    r = r_idx - 1
    c = c_idx + 1
    while (r >= r_min) && (c <= c_max)
      moves << [r, c]
      r -= 1
      c += 1
    end

    # bottom-right: row-increment, column-increment [4, 5] [5, 6]
    r = r_idx + 1
    c = c_idx + 1
    while (r <= r_max) && (c <= c_max)
      moves << [r, c]
      r += 1
      c += 1
    end

    # bottom-left: row-increment, column-decrement [4, 5] [5, 4]
    r = r_idx + 1
    c = c_idx - 1
    while (r <= r_max) && (c >= c_min)
      moves << [r, c]
      r += 1
      c -= 1
    end

    # top-left: row-decrement, column-decrement [4, 5] [3, 4]
    r = r_idx - 1
    c = c_idx - 1
    while (r >= r_min) && (c >= c_min)
      moves << [r, c]
      r -= 1
      c -= 1
    end

    # TODO
    #  - refactor to avoid repeated pattern of code without compromising with runtime

    moves
  end
end
