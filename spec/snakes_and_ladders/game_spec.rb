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
      let(:options) { { roll_die: 3, position: 1, position_plus_last_roll: 4 } }

      let(:mario) { double(:mario, options) }
      let(:luigi) { double(:luigi, options) }
      let(:peach) { double(:peach, options) }

      let(:players) { [mario, luigi, peach] }

      let(:cell) { double(:cell) }
      let(:board) { double(:board, size: 10, move: true) }

      let(:game) { Game.new(board: board, players: players) }

      it "sets player" do
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

    describe "#will_win?" do
      context "when roll exceeds board size" do
        let(:mario) { double(:mario, roll_die: 2, position: 9, position_plus_last_roll: 11, turns: 1) }
        let(:board) { double(:board, size: 10, move: false) }
        let(:game) { Game.new(board: board, players: [mario]) }

        it "assigns winner to mario" do
          game.play_turn
          expect(game.will_win?).to be true
        end
      end

      context "when roll does not exceed board size" do
        let(:mario) { double(:mario, roll_die: 2, position: 7, position_plus_last_roll: 9, turns: 4) }
        let(:board) { double(:board, size: 10, move: true) }
        let(:game) { Game.new(board: board, players: [mario]) }

        it "assigns winner to mario" do
          game.play_turn
          expect(game.will_win?).to be false
        end
      end
    end

    describe "#won?" do
      context "when player reaches last cell" do
        let(:mario) { double(:mario, roll_die: 1, position: 10, position_plus_last_roll: 10, turns: 4) }
        let(:board) { double(:board, size: 10, move: true) }
        let(:game) { Game.new(board: board, players: [mario]) }

        it "assigns winner to mario" do
          game.play_turn
          expect(game.won?).to be true
        end
      end

      context "when player does not reach last cell" do
        let(:mario) { double(:mario, roll_die: 1, position: 8, position_plus_last_roll: 9, turns: 4) }
        let(:board) { double(:board, size: 10, move: true) }
        let(:game) { Game.new(board: board, players: [mario]) }

        it "assigns winner to mario" do
          game.play_turn
          expect(game.won?).to be false
        end
      end
    end

    describe "#over?" do
      context "when player has won" do
        let(:mario) { double(:mario, roll_die: 1, position: 9, position_plus_last_roll: 9, turns: 4) }
        let(:board) { double(:board, size: 9, move: true) }
        let(:game) { Game.new(board: board, players: [mario]) }

        it "returns true" do
          game.play_turn
          expect(game.over?).to be true
        end
      end

      context "when player has not won" do
        let(:mario) { double(:mario, roll_die: 1, position: 8, position_plus_last_roll: 9, turns: 4) }
        let(:board) { double(:board, size: 11, move: true) }
        let(:game) { Game.new(board: board, players: [mario]) }

        it "returns false" do
          game.play_turn
          expect(game.over?).to be false
        end
      end
    end

    describe "#player" do
      skip
    end
  end
end
