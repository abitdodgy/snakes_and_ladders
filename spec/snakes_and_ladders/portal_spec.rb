require "spec_helper"

module SnakesAndLadders
  describe Portal do
    before do
      @portal = Portal.new(location: 1, destination: 5)
    end

    context "#initialize" do
      it "initializes a cell with a destination" do
        expect { Portal.new(location: 1, destination: 5) }.to_not raise_error
      end

      it "raises an error without a destination" do
        expect { Portal.new(location: 1) }.to raise_error(KeyError)
      end

      it "raises an error if location is equal to destination" do
        expect { Portal.new(location: 1, destination: 1) }.to raise_error(ArgumentError)
      end
    end

    context "#location" do
      it "returns a location" do
        expect(@portal.location).to eq(1)
      end
    end

    context "#destination" do
      it "returns a destination" do
        expect(@portal.destination).to eq(5)
      end
    end

    context "#enter" do
      it "sends the player to the portal destination" do
        board = SnakesAndLadders.classic
        luigi = build_player
        board.add_player(luigi)
        @portal.enter(luigi, board)
        expect(luigi.position).to eq(@portal.destination)
      end
    end

    context "#type" do
      it "returns snake when destination is less than location" do
        portal = Portal.new(location: 5, destination: 1)
        expect(portal.type).to eq(:snake)
      end

      it "returns ladder when location is less than destination" do
        portal = Portal.new(location: 1, destination: 5)
        expect(portal.type).to eq(:ladder)
      end
    end
  end
end
