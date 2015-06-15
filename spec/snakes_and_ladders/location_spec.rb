require "spec_helper"

module SnakesAndLadders
  describe SnakesAndLadders::Location do
    describe ".initialize" do
      it "raises an error without location" do
        expect { Location.new }.to raise_error(ArgumentError).with_message("wrong number of arguments (0 for 1)")
      end

      it "sets location as x" do
        location = Location.new(1)
        expect(location.x).to eq 1
      end
    end

    describe "#eql?" do
      it "treats Location objects with same location value (x) as same object" do
        location, same_location = Location.new(1), Location.new(1)
        expect(location == same_location).to eq true
      end

      it "treats Location objects with same location value as same object within a hash" do
        hash = Hash.new
        expect(hash[Location.new(1)] == hash[Location.new(1)]).to eq true
      end

      it "eql? is aliased to ==" do
        location = Location.new(1)
        expect(location.method(:==)).to eq location.method(:eql?)
      end
    end
  end
end
