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

  # Add a piece on the board, if position already occupied, overwrite.
  # Parameters:
  #  - type (rook, knight, bishop, king, queen, pawn)
  #  - position in algebric notation
  def add_piece color, type, position
    raise PieceError, "Piece type seems to be invalid." unless type.instance_of? String
    raise PieceError, "Piece color seems to be invalid." unless color.instance_of? String

    type = type.strip.downcase
    raise PieceError, "Piece type seems to be invalid." if ['rook', 'knight', 'bishop', 'king', 'queen', 'pawn'].none? { |v| v == type }

    color = color.strip.downcase
    raise PieceError, "Piece color can't be anything other than white or black" if ['white', 'black'].none? { |v| v == color }

    r_idx, c_idx = Board.coord(position)
    @tiles[r_idx][c_idx] = Object.const_get(type.capitalize).send(:new, r_idx, c_idx, color)

    @tiles[r_idx][c_idx]
  end

  # to initialize a board with a set of specified pieces, mostly to facilitate the
  # assignment of multiple pieces, which can be use to setup a new game or to try out
  # some moves
  #
  # parameters:
  #   [ ["white", "knight", "b2"] ]
  #   [ ["white", "rook", "a1"], [ "white", "knight", "a2"] ]
  def self.init_with_pieces pieces=[]
    board = Board.new

    # TODO
    # - Add test cases
    # - subarray shouldn't contain more than 2 elements
    pieces.each do |piece|
      color = piece[0]
      type = piece[1]
      position = piece[2]
      board.add_piece(color, type, position)
    end

    board
  end

  # Return an array of available positions for the piece on specified current position
  # TODO:
  # - Consider parameter to accept Piece instance as well, in addition to position
  # - consider other factors such as tile already occupied by same color piece, piece is in absolute pin
  def available_moves position
    r_idx, c_idx = Board.coord(position)
    @tiles[r_idx][c_idx].potential_moves
  end

  # return 0 based coord of a position
  # parameter: b7
  # result: [6, 1]
  def self.coord position
    raise PositionError, "Value received for position is invalid." unless position.instance_of? String
    raise PositionError, "Value received for position is invalid." unless position.size == 2

    col, row = position.split('')

    r_idx = row.to_i - 1
    raise PositionError, "'#{position}' is not a valid position." if r_idx < 0 || r_idx > 7

    c_idx = COLS[col.downcase.to_sym]
    raise PositionError, "'#{position}' is not a valid position." if c_idx.nil?

    [r_idx, c_idx]
  end

  # return readable position of a piece
  # parameter [7, 4]
  # result: e8
  def self.position coord
    raise CoordError, "Value received for coord is invalid." unless coord.instance_of? Array
    raise CoordError, "Value received for coord is invalid." unless coord.size == 2

    r_idx, c_idx = coord

    raise CoordError, "'#{coord.inspect}' is not a valid position." if r_idx < 0 || r_idx > 7
    raise CoordError, "'#{coord.inspect}' is not a valid position." if c_idx < 0 || c_idx > 7

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
