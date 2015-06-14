require "spec_helper"

module SnakesAndLadders
  describe Dice do
    describe ".roll" do
      it "returns an integer" do
        expect(Dice.roll).to be_an(Integer)
      end

      it "returns an integer greater than 0" do
        expect(Dice.roll).to be > 0
      end

      it "returns an integer less than 7" do
        expect(Dice.roll).to be < 7
      end
    end
  end
end
