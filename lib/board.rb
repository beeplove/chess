class Board

  # start an empty board without any piece on it
  def initialize

  end

  # To add a piece on the board
  def add_piece type, position
    # TODO: validate before adding a piece on the board

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
end
