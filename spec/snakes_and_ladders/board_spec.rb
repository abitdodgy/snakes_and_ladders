require "spec_helper"

module SnakesAndLadders
  describe SnakesAndLadders::Board do
    let(:mario) { build_player }
    let(:board) { Board.new(grid: build_grid) }

    before do
      board.add_player(mario)
    end

    context "#initialize" do
      it "initializes board with a grid" do
        expect { Board.new(grid: "hello") }.to_not raise_error
      end
    end

    context "#grid" do
      it "returns the grid" do
        board = Board.new(grid: "grid")
        expect(board.grid).to eq("grid")
      end
    end

    context "#players" do
      it "returns an array" do
        expect(board.players).to be_an(Array)
      end
    end

    context "#turn" do
      it "returns how many turns have been played" do
        expect(board.turn).to eq(0)
        board.play_turn
        expect(board.turn).to eq(1)
      end
    end

    context "#winner" do
      it "returns game winner" do
        expect(board.winner).to eq(nil)
        board.simulate
        expect(board.winner).to eq(mario)
      end
    end

    context "#die" do
      it "returns game winner" do
        expect(board.die).to eq(nil)
        board.play_turn
        expect(board.die).to be_an(Integer)
      end
    end

    context "#game_over?" do
      it "returns true when game is over" do
        expect(board.game_over?).to eq(false)
        board.simulate
        expect(board.game_over?).to eq(true)
      end
    end

    context "#add_player" do
      let(:luigi) { "Luigi" }

      it "adds a player to the board" do
        board.add_player(luigi)
        expect(board.players).to include(luigi)
      end
    end

    context "#current_player" do
      let(:luigi) { "Luigi" }

      before do
        board.add_player(luigi)
      end

      it "adds a player to the board" do
        expect(board.current_player).to be(mario)
        board.play_turn
        expect(board.current_player).to be(luigi)
      end
    end

    context "#get_cell" do
      let(:board) { Board.new(grid: ["Mario", "Luigi", "Peach"]) }

      it "returns the cell based on index" do
        expect(board.get_cell(2)).to eq("Peach")
      end
    end

    context "#move to a portal" do
      it "moves a player from a cell to another cell" do
        expect(mario.position).to be(0)
        board.move(mario, mario.position, 3)
        expect(mario.position).to be(3)
      end
    end

    context "#move to a portal" do
      before do
        board.grid[3] = Portal.new(location: 3, destination: 6)
      end

      it "moves a player from a cell to a portal destination" do
        expect(mario.position).to be(0)
        board.move(mario, mario.position, 3)
        expect(mario.position).to be(6)
      end
    end

    context "#play_turn" do
      let(:luigi) { build_player(name: "Luigi", color: "Green") }

      before do
        board.add_player(luigi)
      end

      it "plays a turn" do
        expect(board.turn).to eq(0)
        expect(board.current_player).to eq(mario)
        expect(board.winner).to be(nil)
        expect(board.game_over?).to be(false)
        expect(board.die).to eq(nil)
        expect(mario.position).to be(0)
        expect(luigi.position).to be(0)

        board.play_turn

        expect(board.turn).to eq(1)
        expect(board.die).to be_a(Integer)
        expect(board.current_player).to eq(luigi)
        expect(mario.position).to eq(board.die)
        expect(luigi.position).to be(0)
        expect(board.game_over?).to be(false)

        board.simulate

        expect([mario, luigi]).to include(board.winner)
        expect(board.game_over?).to eq(true)
      end
    end
  end
end
