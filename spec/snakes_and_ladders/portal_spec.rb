require "spec_helper"

module SnakesAndLadders
  describe Portal do
    let(:portal) { Portal.new(location: 3, destination: 5) }

    describe "#initialize" do
      it "raises an error without location" do
        expect { Portal.new(destination: 1) }.to raise_error(ArgumentError).with_message("missing keyword: location")
      end

      it "raises an error without destination" do
        expect { Portal.new(location: 1) }.to raise_error(ArgumentError).with_message("missing keyword: destination")
      end

      it "sets destination" do
        expect(portal.destination).to eq 5
      end

      it "calls super and sets location" do
        expect(portal.location).to eq 3
      end

      it "raises an error when location is equal to destination" do
        expect { Portal.new(location: 1, destination: 1) }.to raise_error(ArgumentError)
      end
    end

    describe "#location" do
      it "returns location" do
        expect(portal.location).to eq 3
      end
    end

    describe "#destination" do
      it "returns destination" do
        expect(portal.destination).to eq 5
      end
    end

    describe "#enter" do
      let(:board) { double(:board) }

      it "moves player to cell corresponding to its destination" do
        expect(board).to receive(:move).with("Mario", portal.location, portal.destination)
        portal.enter("Mario", board)
      end
    end

    describe "#type" do
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
