require './chess'

RSpec.describe Board do

  describe ".coord" do
    it "should return [0,0] for position a1" do
      expect(Board.coord("a1")).to eq([0,0])
    end

    it "should return [7,7] for position h8" do
      expect(Board.coord("h8")).to eq([7,7])
    end

    it "accept uppercase position too" do
      expect(Board.coord("C8")).to eq([7,2])
    end

    it "should raise PositionError for incorrect position" do
      expect{ Board.coord("a0") }.to raise_error(PositionError)
      expect{ Board.coord("1a") }.to raise_error(PositionError)
      expect{ Board.coord("b10") }.to raise_error(PositionError)
      expect{ Board.coord(['a', '1']) }.to raise_error(PositionError)
    end
  end

  describe ".position" do
    it "should return b3 for coord [2, 1]" do
      expect(Board.position([2, 1])).to eq("b3")
    end

    it "should raise CoordError for incorrect coord" do
      expect{ Board.position([1, 8]) }.to raise_error(CoordError)
      expect{ Board.position([-1, 2]) }.to raise_error(CoordError)
      expect{ Board.position("b1") }.to raise_error(CoordError)
      expect{ Board.position([1, 2, 3]) }.to raise_error(CoordError)
    end
  end

  describe "#initialize" do
    let(:board) { Board.new }
    let(:tiles) { board.instance_variable_get(:@tiles)}

    it "should initialize board with 8x8 tiles with no pieces" do
      expect(tiles.size).to eq(8)
      tiles.each_with_index do |row, i|
        expect(row.size).to eq(8)
        expect(row[i]).to be nil
      end
    end
  end

  describe "#add_piece" do
    let(:board) { Board.new }
    let(:tiles) { board.instance_variable_get(:@tiles)}

    it "should assign a Rook to the tile when added a rook" do
      board.add_piece('white', 'rook', 'b2')
      expect(tiles[1][1].instance_of? Rook).to be true
    end

    it "should assign a Knight to the tile when added a knight" do
      board.add_piece('white', 'knight', 'b2')
      expect(tiles[1][1].instance_of? Knight).to be true
    end

    it "should assign a Bishop to the tile when added a bishop" do
      board.add_piece('white', 'bishop', 'b2')
      expect(tiles[1][1].instance_of? Bishop).to be true
    end

    it "should assign a King to the tile when added a king" do
      board.add_piece('white', 'king', 'b2')
      expect(tiles[1][1].instance_of? King).to be true
    end

    it "should assign a Queen to the tile when added a queen" do
      board.add_piece('white', 'queen', 'b2')
      expect(tiles[1][1].instance_of? Queen).to be true
    end

    it "should assign a Pawn to the tile when added a pawn" do
      board.add_piece('white', 'pawn', 'b2')
      expect(tiles[1][1].instance_of? Pawn).to be true
    end

    it "should accept piece type in any case (not case sensitive)" do
      board.add_piece('white', 'Queen', 'b2')
      expect(tiles[1][1].instance_of? Queen).to be true

      board.add_piece('white', 'KNIGHT', 'b2')
      expect(tiles[1][1].instance_of? Knight).to be true

      board.add_piece('white', 'rOoK', 'b2')
      expect(tiles[1][1].instance_of? Rook).to be true
    end

    it "should return a kind of a Piece" do
      %w{ rook knight bishop king queen pawn}.each do |type|
        piece = board.add_piece('white', type, 'c4')
        expect(piece.kind_of? Piece).to be true
      end
    end

    it "should raise error when attempting to add an unknow piece type" do
      expect { board.add_piece('white', "Horse", "b2") }.to raise_error(PieceError)
    end
  end

  describe "#available_moves" do
    context "when piece is Rook" do
      let(:board) { Board.new }
      let(:type) { 'rook' }

      it "total number of possible moves should be 14" do
        position = 'a1'
        board.add_piece('white', type, position)
        moves = board.available_moves(position)
        expect(moves.size).to eq(14)
      end

      it "should not include current position in the available" do
        position = 'e4'
        coord = [3, 4]
        board.add_piece('white', type, position)
        moves = board.available_moves(position)
        expect(moves.none? {|c| c == coord}).to be true
      end

      it "should be able to move to any tile on the same row" do
        position = "b6"
        coord = [5, 1]

        board.add_piece('white', type, position)
        moves = board.available_moves(position)

        0.upto(Board::WIDTH - 1) do |col|
          next if col == coord[1]
          expect(moves.include? [coord[0], col]).to be true
        end
      end

      it "should be able to move to any tile on the same column" do
        position = "b6"
        coord = [5, 1]

        board.add_piece('white', type, position)
        moves = board.available_moves(position)

        0.upto(Board::WIDTH - 1) do |row|
          next if row == coord[0]
          expect(moves.include? [row, coord[1]]).to be true
        end
      end
    end

    context "when piece is Knight" do
      let(:board) { Board.new }
      let(:type) { 'knight' }

      it "should have 2 available moves if current position is one of the corner" do
        %w{ a1 a8 h1 h8}.each do |position|
          board.add_piece('white', type, position)
          moves = board.available_moves(position)
          expect(moves.size).to eq(2)
        end
      end

      it "should have 3 available moves from one of the begining positions of knight" do
        %w{ a2 a7 h2 h7}.each do |position|
          board.add_piece('white', type, position)
          moves = board.available_moves(position)
          expect(moves.size).to eq(3)
        end
      end

      it "should have 8 available moves from one of center position" do
        %w{ d4 d5 e4 e5}.each do |position|
          board.add_piece('white', type, position)
          moves = board.available_moves(position)
          expect(moves.size).to eq(8)
        end
      end

      it "should be able to move to d1 or h1 from f2" do
        board.add_piece('white', type, 'f2')
        moves = board.available_moves('f2')
        expect(moves.include? [0,3]).to be true
        expect(moves.include? [0,7]).to be true
      end
    end

    context "when piece is Queen" do
      let(:board) { Board.new }
      let(:type) { 'queen' }

      it "should have 27 available moves from one the center position" do
        %w{ d4 d5 e4 e5}.each do |position|
          board.add_piece('white', type, position)
          moves = board.available_moves(position)
          expect(moves.size).to eq(27)
        end
      end

      it "should have 21 available moves if current position is one of the corner" do
        %w{ a1 a8 h1 h8}.each do |position|
          board.add_piece('white', type, position)
          moves = board.available_moves(position)
          expect(moves.size).to eq(21)
        end
      end

      it "should able to move horizontally" do
        board.add_piece('white', type, "d8")
        moves = board.available_moves("d8")
        [[7,0],[7,1],[7,2],[7,4],[7,5],[7,6],[7,7]].each do |move|
          expect(moves.include? move).to be true
        end
      end

      it "should able to move vertically" do
        board.add_piece('white', type, "d8")
        moves = board.available_moves("d8")
        [[0,3],[1,3],[2,3],[3,3],[4,3],[5,3],[6,3]].each do |move|
          expect(moves.include? move).to be true
        end
      end

      it "should able to move diagonally" do
        board.add_piece('white', type, "d8")
        moves = board.available_moves("d8")
        [[6,4],[5,5],[4,6],[3,7],[6,2],[5,1],[4,0]].each do |move|
          expect(moves.include? move).to be true
        end
      end
    end
  end
end
