require "spec_helper"

module SnakesAndLadders
  describe Location do
    describe ".initialize" do
      it "raises an error without location" do
        expect { Location.new }.to raise_error(ArgumentError).with_message("wrong number of arguments (0 for 1)")
      end

      it "sets location" do
        location = Location.new(1)
        expect(location.x).to eq 1
      end
    end

    describe "#eql?" do
      it "treats Location objects with same location (x) as same object" do
        location, same_location = Location.new(1), Location.new(1)
        expect(location.eql?(same_location)).to eq true
      end
    end

    describe "#==" do
      it "treats Location objects with same location (x) as same object" do
        location, same_location = Location.new(1), Location.new(1)
        expect(location == same_location).to eq true
      end
    end

    describe "#hash" do
      it "calls hash on x" do
        location = Location.new(1)
        expect(location.x).to eq 1.hash
      end
    end
  end
end
