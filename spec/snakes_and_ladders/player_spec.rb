require "spec_helper"

module SnakesAndLadders
  describe Player do
    before do
      @player = Player.new(name: "Mario", color: "Red")
    end

    context "#initialize" do
      it "initializes a player with a name and a color" do
        expect { build_player }.to_not raise_error
      end

      it "raises an error without a name" do
        expect { Player.new(color: "Red") }.to raise_error(KeyError)
      end

      it "raises an error without a color" do
        expect { Player.new(name: "Mario") }.to raise_error(KeyError)
      end
    end

    context "#name" do
      it "returns the player name" do
        expect(@player.name).to eq("Mario")
      end
    end

    context "#color" do
      it "returns the player color" do
        expect(@player.color).to eq("Red")
      end
    end

    context "#cell" do
      let(:cell) { Struct.new(:location).new(5) }

      it "returns sets and returns the player cell" do
        @player.cell = cell
        expect(@player.cell).to eq(cell)
      end
    end

    context "#to_s" do
      it "returns the name attribute" do
        expect(@player.to_s).to eq("Mario")
      end
    end

    context "#position" do
      it "returns 0 if player has no cell" do
        expect(@player.position).to eq(0)
      end

      it "returns cell location if player has one" do
        cell = Struct.new(:location).new(5)
        @player.cell = cell
        expect(@player.position).to eq(5)
      end
    end
  end
end
