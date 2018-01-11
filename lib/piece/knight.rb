class Knight < Piece
  attr_reader :r_idx, :c_idx

  def initialize r_idx, c_idx
    @r_idx = r_idx
    @c_idx = c_idx
  end

  def name
    "K"
  end

  def available_moves
    # 8 possible moves from the logic below
    # - row increment/decrement by 1, col decrement/indrement by 2
    # - col increment/decrement by 1, row decrement/indrement by 2

    moves = []

    if r_idx + 1 <= 7
      moves << [r_idx + 1, c_idx + 2] if c_idx + 2 <= 7
      moves << [r_idx + 1, c_idx - 2] if c_idx - 2 >= 0
    end

    if r_idx - 1 >= 0
      moves << [r_idx - 1, c_idx + 2] if c_idx + 2 <= 7
      moves << [r_idx - 1, c_idx - 2] if c_idx - 2 >= 0
    end

    if c_idx + 1 <= 7
      moves << [r_idx + 2, c_idx + 1] if r_idx + 2 <= 7
      moves << [r_idx - 2, c_idx + 1] if r_idx - 2 >= 0
    end

    if c_idx - 1 >= 0
      moves << [r_idx + 2, c_idx - 1] if r_idx + 2 <= 7
      moves << [r_idx - 2, c_idx - 1] if r_idx - 2 >= 0
    end

    # TODO:
    # - Add test cases
    # - similar code, may have room for meta-programming, possible refactor

    moves
  end
end
