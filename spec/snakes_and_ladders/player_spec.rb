require "spec_helper"

module SnakesAndLadders
  describe Player do
    let(:player) { Player.new(name: "Mario", color: "Red") }

    describe "#initialize" do
      it "raises an error without name" do
        expect { Player.new(color: "Red") }.to raise_error(ArgumentError).with_message("missing keyword: name")
      end

      it "raises an error without color" do
        expect { Player.new(name: "Mario") }.to raise_error(ArgumentError).with_message("missing keyword: color")
      end

      it "sets player name" do
        expect(player.name).to eq "Mario"
      end

      it "sets player color" do
        expect(player.color).to eq "Red"
      end

      it "defaults die_rolls to an empty array" do
        expect(player.die_rolls).to eq []
      end

      it "sets die_rolls" do
        player = Player.new(name: "Mario", color: "Red", die_rolls: [1,2,3])
        expect(player.die_rolls).to eq [1,2,3]
      end

      it "defaults position to 0" do
        expect(player.position).to eq 0
      end

      it "sets position" do
        player = Player.new(name: "Mario", color: "Red", position: 5)
        expect(player.position).to eq 5
      end
    end

    describe "#name" do
      it "returns player name" do
        expect(player.name).to eq "Mario"
      end
    end

    describe "#color" do
      it "returns player color" do
        expect(player.color).to eq "Red"
      end
    end

    describe "#position" do
      it "returns an integer" do
        expect(player.position).to be_an Integer
      end
    end

    describe "#position=" do
      it "sets position" do
        player.position = 5
        expect(player.position).to eq 5
      end
    end

    describe "#to_s" do
      it "returns the name attribute" do
        expect(player.to_s).to eq "Mario"
      end
    end

    describe "#roll_die" do
      it "returns an integer" do
        expect(player.roll_die).to be_an Integer
      end

      it "is greater than 0" do
        expect(player.roll_die).to be > 0
      end

      it "is lesser than 7" do
        expect(player.roll_die).to be < 7
      end

      it "records die roll" do
        roll = player.roll_die
        expect(player.die_rolls).to include roll
      end
    end

    describe "#die_rolls" do
      it "returns an array" do
        expect(player.die_rolls).to be_an Array
      end
    end

    describe "#turns" do
      before do
        3.times { player.roll_die }
      end

      it "returns the number of turns played" do
        expect(player.turns).to eq 3
      end
    end

    describe "#last_roll" do
      it "returns the last die roll" do
        roll = player.roll_die
        expect(player.last_roll).to eq roll
      end
    end

    describe "#position_plus_last_roll" do
      it "returns last roll added to position" do
        roll = player.roll_die
        expect(player.position_plus_last_roll).to eq player.position + roll
      end
    end
  end
end
