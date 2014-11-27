require "spec_helper"

module SnakesAndLadders
  describe Board do
    context "#initialize" do
      it "initializes board with a grid" do
        expect { Board.new(grid: "hello") }.to_not raise_error
      end
    end

    context "#grid" do
      it "returns the grid" do
        board = Board.new(grid: "hello")
        expect(board.grid).to eq("hello")
      end
    end

    context "#players" do
      it "returns an array of players" do
        player = "Mario"
        board = Board.new(grid: "hello")
        board.add_player(player)
        expect(board.players).to eq([player])
      end
    end

    context "#add_player" do
      it "adds a player to the board" do
        player = "Mario"
        board = Board.new(grid: "hello")
        board.add_player(player)
        expect(board.players).to include(player)
      end
    end

    context "#get_cell" do
      it "returns the cell based on index" do
        grid = [nil, nil, "hello"]
        board = Board.new(grid: grid, players: ["Mario"])
        expect(board.get_cell(2)).to eq("hello")
      end
    end

    context "#play_turn" do
      skip
    end

    context "#move to a portal" do
      it "moves a player from a destination cell to a location cell" do
        grid = (0..9).map { |n| Cell.new(location: n) }
        player = build_player
        board = Board.new(grid: grid)
        board.add_player(player)
        board.move(player, player.position, 3)
        expect(player.position).to eql(3)
      end
    end

    context "#move to a portal" do
      it "moves a player from a destination cell to a portal" do
        grid = (0..9).map { |n| Cell.new(location: n) }
        grid[3] = Portal.new(location: 3, destination: 6)
        player = build_player
        board = Board.new(grid: grid)
        board.add_player(player)
        board.move(player, player.position, 3)
        expect(player.position).to eql(6)
      end
    end
  end
end
