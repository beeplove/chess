require './chess'

RSpec.describe Piece do
  describe "#initialize" do
    it "should raise error if color is anything other than black or white" do
      expect { Piece.new(0,0, 'grey') }.to raise_error(PieceError)
    end
  end

  describe "#white?"
  describe "#black?"
end
