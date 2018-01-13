class Board

  WIDTH = 8
  COLS = {
    a: 0,
    b: 1,
    c: 2,
    d: 3,
    e: 4,
    f: 5,
    g: 6,
    h: 7
  }

  COL_NAMES = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h']

  # start an empty board without any piece on it
  def initialize
    @tiles = Array.new(WIDTH)

    0.upto(WIDTH - 1) { |i|
      @tiles[i] = Array.new(WIDTH)
    }
  end

  # To add a piece on the board
  def add_piece type, position
    r_idx, c_idx = Board.coord(position)

    # TODO: Take 'type' into account when initialize a piece
    if type.downcase == 'knight'
      @tiles[r_idx][c_idx] = Knight.new(r_idx, c_idx)
    elsif type.downcase == 'rook'
      @tiles[r_idx][c_idx] = Rook.new(r_idx, c_idx)
    elsif type.downcase == 'queen'
      @tiles[r_idx][c_idx] = Queen.new(r_idx, c_idx)
    else
      @tiles[r_idx][c_idx] = Piece.new(r_idx, c_idx)
    end
  end

  # to initialize a board with a set of specified pieces
  # parameters:
  #   [ ["knight", "b2"] ]
  #   [ ["rook", "a1"], [ "knight", "a2"] ]
  def self.init_with_pieces pieces=[]
    board = Board.new

    # TODO: validate the input before initialize the board
    pieces.each do |piece|
      type = piece[0]
      position = piece[1]
      board.add_piece(type, position)
    end

    board
  end

  # Return an array of available positions for the piece on specified current position
  def available_moves position
    # TODO
    # - Add test cases

    r_idx, c_idx = Board.coord(position)
    @tiles[r_idx][c_idx].available_moves
  end

  # return 0 based coord of a position
  # parameter: b7
  # result: [6, 1]
  def self.coord position
    raise PositionError, "'#{position}' is not a valid position." unless position.instance_of? String
    raise PositionError, "'#{position}' is not a valid position." unless position.size == 2

    col, row = position.split('')

    r_idx = row.to_i - 1
    raise PositionError, "'#{position}' is not a valid position." if r_idx < 0 || r_idx > 7

    c_idx = COLS[col.downcase.to_sym]
    raise PositionError, "'#{position}' is not a valid position." if c_idx.nil?

    [r_idx, c_idx]
  end

  # return readable position of a piece
  # parameter [1, 1]
  # result: b2
  def self.position coord
    # TODO
    # - Add test case
    r_idx, c_idx = coord
    [COL_NAMES[c_idx], (r_idx + 1).to_s].join
  end

  # TODO
  # - possible refactor to move coord and position to a class such as, tile or coord or grid

  def display
    puts "  | " + COLS.keys.sort.collect{|p| p.to_s }.join(" | ")
    puts "----------------------------------"
    @tiles.each_with_index do | row, r |
      puts "#{r + 1} | " + row.collect {|p| p.nil? ? " " : p.name }.join(" | ")
    end
  end
end
