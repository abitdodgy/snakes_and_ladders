require "spec_helper"

module SnakesAndLadders
  describe Cell do
    let(:cell) { Cell.new(location: 1) }

    describe "#initialize" do
      it "raises an error without location" do
        expect { Cell.new }.to raise_error(ArgumentError).with_message("missing keyword: location")
      end

      it "sets location" do
        expect(cell.location).to eq 1
      end

      it "defaults players to empty array" do
        expect(cell.players).to eq []
      end

      it "sets players" do
        cell = Cell.new(location: 1, players: ["Mario"])
        expect(cell.players).to eq ["Mario"]
      end
    end

    describe "#location" do
      it "returns location" do
        expect(cell.location).to eq 1
      end
    end

    describe "#players" do
      it "returns an array" do
        expect(cell.players).to be_an Array
      end
    end

    describe "#enter" do
      let(:mario) { double(:mario) }

      it "updates player position and adds player to players array" do
        expect(mario).to receive(:position=).with cell.location
        cell.enter(mario, "Board")
        expect(cell.players).to include mario
      end
    end

    describe "#exit" do
      let(:cell) { Cell.new(location: 1, players: ["mario"]) }

      it "delete player from players array" do
        cell.exit("mario")
        expect(cell.players).not_to include "mario"
      end
    end
  end
end
