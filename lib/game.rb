class Game

  attr_reader :board

  def initialize
    @board = Board.new
  end

  def start
    [
      [ "white", "rook",    "a1" ],
      [ "white", "knight",  "b1" ],
      [ "white", "bishop",  "c1" ],
      [ "white", "queen",   "d1" ],
      [ "white", "king",    "e1" ],
      [ "white", "bishop",  "f1" ],
      [ "white", "knight",  "g1" ],
      [ "white", "rook",    "h1" ],
      [ "white", "pawn",    "a2" ],
      [ "white", "pawn",    "b2" ],
      [ "white", "pawn",    "c2" ],
      [ "white", "pawn",    "d2" ],
      [ "white", "pawn",    "e2" ],
      [ "white", "pawn",    "f2" ],
      [ "white", "pawn",    "g2" ],
      [ "white", "pawn",    "h2" ],

      [ "black", "rook",    "a8" ],
      [ "black", "knight",  "b8" ],
      [ "black", "bishop",  "c8" ],
      [ "black", "queen",   "d8" ],
      [ "black", "king",    "e8" ],
      [ "black", "bishop",  "f8" ],
      [ "black", "knight",  "g8" ],
      [ "black", "rook",    "h8" ],
      [ "black", "pawn",    "a7" ],
      [ "black", "pawn",    "b7" ],
      [ "black", "pawn",    "c7" ],
      [ "black", "pawn",    "d7" ],
      [ "black", "pawn",    "e7" ],
      [ "black", "pawn",    "f7" ],
      [ "black", "pawn",    "g7" ],
      [ "black", "pawn",    "h7" ],
    ].each do | piece |
      color, type, position = piece
      @board.add_piece(color, type, position)
    end

    self
  end

end

