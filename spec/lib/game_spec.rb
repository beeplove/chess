require './chess'

RSpec.describe Game do

  describe "#start" do
    let(:game) {
      game = Game.new
      game.start
    }

    it "should put all white and black pieces on initial position" do
      rook = game.board.piece("a1")

      expect(rook.name).to eql("R")
      expect(rook.white?).to be true
    end

  end

end
