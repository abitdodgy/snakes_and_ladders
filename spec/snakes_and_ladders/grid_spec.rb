require "spec_helper"

module SnakesAndLadders
  describe Grid do
    let(:grid) { Grid.new(size: 10) }

    context "#initialize" do
      it "raises an error without size" do
        expect { Grid.new }.to raise_error(ArgumentError).with_message("missing keyword: size")
      end

      it "raises an error if object mappings are greater than size" do
        expect { Grid.new(size: 1, object_mappings: [{ 1 => 1 }, { 2 => 2 }]) }.to raise_error(ArgumentError)
      end

      it "sets size" do
        expect(grid.size).to eq 10
      end

      it "sets object_mappings" do
        object_mappings = [{ princess: "peach" }]
        grid = Grid.new(size: 10, object_mappings: object_mappings)
        expect(grid.object_mappings).to eq object_mappings
      end

      it "defaults object_mappings to an empty hash" do
        expect(grid.object_mappings).to eq Array.new
      end

      it "sets default_object" do
        grid = Grid.new(size: 10, default_object: :BowserCastle)
        expect(grid.default_object).to eq :BowserCastle
      end

      it "defaults default_object to Cell" do
        expect(grid.default_object).to eq :Cell
      end
    end

    describe "#size" do
      it "returns an Integer" do
        expect(grid.size).to be_an Integer
      end
    end

    describe "#object_mappings" do
      it "returns a hash" do
        expect(grid.object_mappings).to be_an Array
      end
    end

    describe "#build" do
      let :object_mappings do
        [
          { class: :Portal, location: 1, destination: 3 },
          { class: :Portal, location: 4, destination: 2 },
        ]
      end

      it "builds a grid from mappings" do
        grid = Grid.new(size: 4, object_mappings: object_mappings).build
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

    describe "#build with custom default_object" do
      let :object_mappings do
        [ { class: :Portal, location: 1, destination: 3 } ]
      end

      let(:castle) { double(:Castle) }

      it "builds a grid from mappings" do
        skip "not sure how to test this since we have no custom class"
        grid = Grid.new(size: 3, object_mappings: object_mappings, default_object: :Castle).build
      end
    end

    describe "CLASSIC_BOARD_MAPPINGS" do
      it "should define classic board const" do
        expect(Grid).to have_constant(:CLASSIC_BOARD_MAPPINGS)
      end
    end
  end
end
