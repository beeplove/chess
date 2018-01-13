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

    it "should assign a Piece to the tile" do
      expect(tiles[1][1]).to eq(nil)
      board.add_piece('knight', 'b2')
      expect(tiles[1][1].instance_of? Knight).to be true
    end

    it "should add only the known pieces" do
    end
  end

  describe "#available_moves" do
    context "when piece is Rook" do
      let(:board) { Board.new }

      it "total number of possible moves should be 14" do
        position = 'a1'
        board.add_piece('rook', position)
        moves = board.available_moves(position)
        expect(moves.size).to eq(14)
      end
    end
  end
end
