
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

end
