require "spec_helper"

module SnakesAndLadders
  describe Cell do
    before do
      @cell = Cell.new(location: 1)
    end

    context "#initialize" do
      it "initializes a cell with a location" do
        expect { Cell.new(location: 1) }.to_not raise_error
      end

      it "raises an error without a location" do
        expect { Cell.new({}) }.to raise_error(KeyError)
      end
    end

    context "#location" do
      it "returns a location" do
        expect(@cell.location).to eq(1)
      end
    end

    context "#players" do
      before do
        @cell.players << "Luigi"
      end

      it "returns an array of players" do
        expect(@cell.players).to eq(["Luigi"])
      end
    end

    context "on enter" do
      it "sets the player position to its location" do
        player = build_player
        @cell.enter(player, "board")
        expect(@cell.players).to eq([player])
        expect(player.cell).to eq(@cell)
      end
    end

    context "#exit" do
      it "deletes the player from the players array" do
        mario = build_player
        @cell.players << mario
        @cell.exit(mario)
        expect(@cell.players).not_to include(mario)
        expect(mario.cell).not_to eq(@cell)
      end
    end
  end
end
