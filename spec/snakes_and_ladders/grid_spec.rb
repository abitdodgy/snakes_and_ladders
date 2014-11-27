require "spec_helper"

module SnakesAndLadders
  describe Grid do
    context "#initialize" do
      it "initializes a grid with a size and portals" do
        expect { Grid.new(size: 10, portals: []) }.to_not raise_error
      end

      it "initializes a world with without portals" do
        expect { Grid.new(size: 10) }.to_not raise_error
      end

      it "raises an error without a size" do
        expect { Grid.new(portals: []) }.to raise_error(KeyError)
      end
    end

    describe "#size" do
      it "returns grid size" do
        grid = Grid.new(size: 10)
        expect(grid.size).to eq(10)
      end
    end

    describe "#portals" do
      it "returns an array" do
        portals = [ [1, 2], [3, 4] ]
        grid = Grid.new(size: 10, portals: portals)
        expect(grid.portals).to eq(portals)
      end
    end

    describe "#build" do
      it "builds a grid and includes portals in at the correct index" do
        portals = [ [1, 2], [4, 3] ]
        grid = Grid.new(size: 10, portals: portals).build
        expect(grid[1].class).to eq(Portal)
        expect(grid[5].class).to eq(Cell)
        expect(grid.size).to eq(10)
      end
    end
  end
end
