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

  # start an empty board without any piece on it
  def initialize
    @tiles = Array.new(WIDTH)

    0.upto(WIDTH - 1) { |i|
      @tiles[i] = Array.new(WIDTH)
    }
  end

  # To add a piece on the board
  def add_piece type, position
    # TODO: validate before adding a piece on the board

    col, row = position.split('')
    c_idx = COLS[col.downcase.to_sym]
    r_idx = row.to_i - 1


    # TODO: Take 'type' into account when initialize a piece
    if type.downcase == 'knight'
      @tiles[r_idx][c_idx] = Knight.new(r_idx, c_idx)
    else
      @tiles[r_idx][c_idx] = Piece.new
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

    []
  end

  def display
    puts "  | " + COLS.keys.sort.collect{|p| p.to_s }.join(" | ")
    puts "----------------------------------"
    @tiles.each_with_index do | row, r |
      puts "#{r} | " + row.collect {|p| p.nil? ? " " : p.name }.join(" | ")
    end
  end
end
