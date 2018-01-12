require './chess'

RSpec.describe Board do

  describe "#available_moves" do
    context "when piece is Rook" do
      before(:each) do
        @board = Board.new
      end

      it "total number of possible moves should be 14" do
        position = 'a1'
        @board.add_piece('rook', position)
        moves = @board.available_moves(position) 
        expect(moves.size).to eq(14)
      end
    end
  end
end