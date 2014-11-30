require "spec_helper"

module SnakesAndLadders
  describe Grid do
    let(:grid) { Grid.new(size: 10) }

    context "#initialize" do
      it "raises an error without size" do
        expect { Grid.new }.to raise_error(ArgumentError).with_message("missing keyword: size")
      end

      it "raises an error if object mappings are greater than size" do
        expect { Grid.new(size: 1, tile_mappings: [{ 1 => 1 }, { 2 => 2 }]) }.to raise_error(ArgumentError)
      end

      it "sets size" do
        expect(grid.size).to eq 10
      end

      it "sets tile_mappings" do
        tile_mappings = [{ princess: "peach" }]
        grid = Grid.new(size: 10, tile_mappings: tile_mappings)
        expect(grid.tile_mappings).to eq tile_mappings
      end

      it "defaults tile_mappings to an empty array" do
        expect(grid.tile_mappings).to eq Array.new
      end

      it "sets default_tile" do
        grid = Grid.new(size: 10, default_tile: :BowserCastle)
        expect(grid.default_tile).to eq :BowserCastle
      end

      it "defaults default_tile to Cell" do
        expect(grid.default_tile).to eq :Cell
      end
    end

    describe "#size" do
      it "returns an integer" do
        expect(grid.size).to be_an Integer
      end
    end

    describe "#tile_mappings" do
      it "returns an array" do
        expect(grid.tile_mappings).to be_an Array
      end
    end

    describe "#default_tile" do
      it "returns a symbol" do
        expect(grid.default_tile).to be_an Symbol
      end
    end

    describe "#build" do
      let :tile_mappings do
        [
          { class: :Portal, location: 1, destination: 3 },
          { class: :Portal, location: 4, destination: 2 },
        ]
      end

      it "builds a grid from mappings" do
        grid = Grid.new(size: 4, tile_mappings: tile_mappings).build
        expect(grid).to be_a Hash

        expect(grid[1]).to be_a Portal
        expect(grid[2]).to be_a Cell
        expect(grid[3]).to be_a Cell
        expect(grid[4]).to be_a Portal

        expect(grid[1].location).to eq 1
        expect(grid[2].location).to eq 2
        expect(grid[3].location).to eq 3
        expect(grid[4].location).to eq 4

        expect(grid[1].destination).to eq 3
        expect(grid[4].destination).to eq 2
      end
    end

    describe "#build with custom default_tile" do
      let :tile_mappings do
        [ { class: :Portal, location: 1, destination: 3 } ]
      end

      let(:castle) { double(:Castle) }

      it "builds a grid from mappings" do
        skip "not sure how to test this since we have no custom class"
        # grid = Grid.new(size: 3, tile_mappings: tile_mappings, default_tile: :Castle).build
      end
    end

    describe "CLASSIC_BOARD_MAPPINGS" do
      it "should define classic board const" do
        expect(Grid).to have_constant(:CLASSIC_BOARD_MAPPINGS)
      end
    end

    describe ".classic" do
      skip "just a reminder to test this class method"
    end
  end
end
