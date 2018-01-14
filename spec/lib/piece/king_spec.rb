require './chess'

RSpec.describe King do
  describe "#potential_moves" do
    let(:king) { King.new(3,4) }

    it "should return tiles attached diagonally to the current tile" do
      moves = king.potential_moves
      [[2,3], [2,5], [4,3], [4,5]].each do |coord|
        expect(moves.include? coord).to be true
      end
    end

    it "should return tiles attached horizontally and vertically to the current tile" do
      moves = king.potential_moves
      [[2,4], [4,4], [3,5], [3,3]].each do |coord|
        expect(moves.include? coord).to be true
      end
    end
  end
end
