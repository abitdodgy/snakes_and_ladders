require "spec_helper"

module SnakesAndLadders
  describe GameBoard do
    describe ".initialize" do
      it "sets grid" do
        board = GameBoard.new(grid: "any")
        expect(board.grid).to eq "any"
      end

      it "sets size" do
        board = GameBoard.new(size: 1)
        expect(board.size).to eq 1
      end

      it "defaults size to 100" do
        expect(GameBoard.new.size).to eq 100
      end
    end

    describe "#[]" do
      let(:location) { double(:x) }

      it "returns location from the grid" do
        board = GameBoard.new(grid: { location => 2 })
        expect(board[location]).to eq 2
      end
    end

    describe "#[]=" do
      let(:location) { double(x: 1) }

      it "sets location on the grid" do
        board = GameBoard.new
        board[location] = "hello"
        expect(board[location]).to eq "hello"
      end

      it "returns nil if location is less than 1" do
        board = GameBoard.new
        location = double(x: 0)
        board[location] = "hello"
        expect(board[location]).to be_nil
      end

      it "returns nil if location is greater than size" do
        board = GameBoard.new(size: 5)
        location = double(x: 6)
        board[location] = "hello"
        expect(board[location]).to be_nil
      end

      it "overwrites locations with same index" do
        board = GameBoard.new
        location = Location.new(1)
        board[location] = "hello"
        expect(board[location]).to eq "hello"
        other_location = Location.new(1)
        board[other_location] = "goodbye"
        expect(board[location]).to eq "goodbye"
      end
    end
  end
end
