require "spec_helper"

module SnakesAndLadders
  describe SnakesAndLadders::Board do
    let(:luigi) { double(:player) }

    let(:first_cell) { double(:cell) }
    let(:second_cell) { double(:cell) }

    let(:grid) { { 3 => first_cell, 6 => second_cell } }

    let(:board) { Board.new(grid: grid) }

    describe "#initialize" do
      it "defaults to classic grid" do
        expect { Board.new }.not_to raise_error
      end

      it "sets grid" do
        board = Board.new(grid: "any")
        expect(board.grid).to eq "any"
      end
    end

    describe "#grid" do
      it "returns the grid" do
        expect(board.grid).to eq grid
      end
    end

    describe "#size" do
      it "returns grid size" do
        expect(board.size).to eq 2
      end
    end

    describe "#get_cell" do
      it "returns object at index" do
        expect(board.get_cell(3)).to eq first_cell
      end

      it "returns nil if there is no object at index" do
        expect(board.get_cell(4)).to be_nil
      end
    end

    describe "#move" do
      context "when player is off the board" do
        it "moves player to destination" do
          expect(first_cell).to_not receive(:exit)
          expect(second_cell).to receive(:enter).with luigi, board
          board.move(luigi, 0, 6)
        end
      end

      context "when player is on a cell" do
        it "moves player between cells" do
          expect(first_cell).to receive(:exit).with luigi
          expect(second_cell).to receive(:enter).with luigi, board
          board.move(luigi, 3, 6)
        end
      end

      context "when movement exceeds board size" do
        it "does not move player and returns false" do
          expect(second_cell).to_not receive :exit
          expect(second_cell).not_to receive :enter
          result = board.move(luigi, 3, 7)
          expect(result).to be_nil
        end
      end
    end
  end
end
