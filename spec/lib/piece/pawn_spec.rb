require './chess'

RSpec.describe Pawn do
  describe "#potential_moves" do
    context "when pawn is white" do
      let(:pawn) { Pawn.new(1, 0) }

      it "should move the next rank from the initial position" do
        moves = pawn.potential_moves
        expect(moves.include? [2,0]).to be true
      end
    end

    context "when pawn is black" do
      let(:pawn) { Pawn.new(6, 0, 'black') }

      it "should move the next rank from the initial position" do
        moves = pawn.potential_moves
        expect(moves.include? [5,0]).to be true
      end
    end
  end
end
