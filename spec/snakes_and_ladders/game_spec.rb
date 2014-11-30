require "spec_helper"

module SnakesAndLadders
  describe Game do
    let(:game) { Game.new(board: "Board") }

    describe "#initialize" do
      it "raises an error without board" do
        expect { Game.new }.to raise_error(ArgumentError).with_message("missing keyword: board")
      end

      it "sets a board" do
        expect(game.board).to eq "Board"
      end

      it "defaults players to empty array" do
        expect(game.players).to eq []
      end

      it "sets players array" do
        game = Game.new(board: "Board", players: %w(Mario Luigi))
        expect(game.players).to eq %w(Mario Luigi)
      end

      it "defaults turn to 0" do
        expect(game.turn).to eq 0
      end

      it "sets turn" do
        game = Game.new(board: "Board", turn: 5)
        expect(game.turn).to eq 5
      end
    end

    describe "#board" do
      it "returns game board" do
        expect(game.board).to eq "Board"
      end
    end

    describe "#players" do
      it "returns an array" do
        expect(game.players).to be_an Array
      end
    end

    describe "#turn" do
      it "return an integer" do
        expect(game.turn).to be_an Integer
      end
    end

    describe "#play_turn" do
      let(:mario) { double(:player, roll_die: 3, position: 1, destination_after_last_roll: 4, turns: 2) }
      let(:luigi) { double(:player, roll_die: 0, position: 0, destination_after_last_roll: 0, turns: 0) }
      let(:peach) { double(:player) }

      let(:players) { [mario, luigi, peach] }

      let(:board) { double(:board, size: 10, move: true) }
      let(:game) { Game.new(board: board, players: players) }

      it "defaults winner to nil" do
        expect(game.winner).to be_nil
      end

      it "is not over" do
        expect(game.over?).to eq false
      end

      it "cycles player turns" do
        game.play_turn
        expect(game.player).to eq mario
        game.play_turn
        expect(game.player).to eq luigi
      end

      it "calls player.roll_die" do
        expect(mario).to receive(:roll_die)
        game.play_turn
      end

      it "increments turn" do
        game.play_turn
        expect(game.turn).to eq 1
      end

      it "calls board.move" do
        expect(board).to receive(:move).with(mario, 1, 4)
        game.play_turn
      end
    end

    describe "#simulate" do
      let(:mario) { Player.new(name: "Mario", color: "Red") }
      let(:luigi) { Player.new(name: "Luigi", color: "Green") }

      let(:game) { Game.new(board: Board.new, players: [mario, luigi]) }

      before { game.simulate }

      it "simulates and entire game" do
        expect(game.over?).to eq true
        expect(game.players).to include game.winner
        expect(game.play_turn).to be_nil
      end
    end

    describe "#over?" do
      # This depends on the position attribute to decide winner.
      # This tests the "board.move returns true" scenario, so we must assume mario already moved, and his position was updated.
      # This explains why position and destination_after_last_roll are equal, which happens when the player moves.
      context "when player lands on last square" do
        let(:board) { double(:board, size: 10, move: true) }
        let(:mario) { double(:mario, roll_die: 1, position: 10, destination_after_last_roll: 10, turns: 1) }
        let(:game) { Game.new(board: board, players: [mario]) }

        it "returns true" do
          game.play_turn
          expect(game.over?).to be true
        end
      end

      # This depends on destination_after_last_roll to decide winner.
      # This tests the "board.move returns false" scenario. So mario's position does not get updated, and we must decide if his roll
      # takes him over the winning line, since he can't move off the board.
      context "when player roll will cause it to exceed last cell" do
        let(:board) { double(:board, size: 10, move: false) }
        let(:mario) { double(:mario, roll_die: 3, position: 9, destination_after_last_roll: 12, turns: 1) }
        let(:game) { Game.new(board: board, players: [mario]) }

        it "returns true" do
          game.play_turn
          expect(game.over?).to be true
        end
      end

      context "when player roll is not sufficient to win" do
        let(:board) { double(:board, size: 10, move: true) }
        let(:mario) { double(:mario, roll_die: 1, position: 8, destination_after_last_roll: 9) }
        let(:game) { Game.new(board: board, players: [mario]) }

        before { game.add_player(mario) }

        it "returns false" do
          game.play_turn
          expect(game.over?).to be false
        end
      end
    end
  end
end
