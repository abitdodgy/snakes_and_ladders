require "spec_helper"

module SnakesAndLadders
  describe World do
    context "#initialize" do
      it "initializes a world with a size and snake and ladder counts" do
        expect { World.new(size: 10, snakes: 2, ladders: 2) }.to_not raise_error
      end

      it "initializes a world with without snake and ladder counts" do
        expect { World.new(size: 10) }.to_not raise_error
      end

      it "raises an error without a size" do
        expect { World.new(snakes: 2, ladders: 2) }.to raise_error(KeyError)
      end
    end

    context "#generate" do
      it "generates a random portal configuration" do
        world = World.new(size: 10).generate
        expect(world.class).to be(Array)
      end
    end
  end
end
