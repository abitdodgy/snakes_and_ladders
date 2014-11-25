require "spec_helper"

module SnakesAndLadders
  describe Cell do
    context "#initialize" do
      it "initializes a cell with a location" do
        expect { Cell.new(location: 1) }.to_not raise_error
      end

      it "initializes a cell with a players array" do
        expect { Cell.new(location: 1, players: ["Mario"]) }.to_not raise_error
      end

      it "raises an error without a location" do
        expect { Cell.new({}) }.to raise_error(KeyError)
      end
    end

    context "#location" do
      it "returns a location" do
        cell = Cell.new(location: 1)
        expect(cell.location).to eq(1)
      end
    end

    context "#players" do
      it "returns an array of players" do
        cell = Cell.new(location: 1, players: ["Luigi"])
        expect(cell.players).to eq(["Luigi"])
      end
    end

    context "on enter" do
      skip
    end

    context "on exit" do
      skip
    end
  end
end