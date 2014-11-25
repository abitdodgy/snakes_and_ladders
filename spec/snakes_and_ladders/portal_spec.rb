require "spec_helper"

module SnakesAndLadders
  describe Portal do
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
        portal = Portal.new(location: 1, destination: 5)
        expect(portal.location).to eq(1)
      end
    end

    context "#destination" do
      it "returns a destination" do
        portal = Portal.new(location: 1, destination: 5)
        expect(portal.destination).to eq(5)
      end
    end
  end
end