module SnakesAndLadders
  class Board
    attr_reader :grid, :players, :turn, :winner, :die

    def initialize(input = {})
      @grid = input.fetch(:grid)
      @players = []
      @turn = 0
    end

    def add_player(player)
      players << player
    end

    def get_cell(key)
      grid[key]
    end

    def move(player, from, to)
      if cell = get_cell(from)
        cell.exit(player)
      end

      if cell = get_cell(to)
        cell.enter(player, self)
      end
    end

    def play_turn
      return "Game over!" if game_over?

      roll_die

      if will_win?
        self.winner = current_player
        puts "#{winner} rolls a #{die} and wins in #{rounds} turns! Congratulations!"
      else
        puts "#{current_player} rolls #{die} and moves from #{current_player.position} to #{current_player.position + die}"
        move(current_player, current_player.position, current_player.position + die)
      end

      increment_turn
    end

    def game_over?
      !!winner
    end

    def current_player
      players.fetch(turn % players.size)
    end

    def simulate
      play_turn until game_over?
    end

  private

    attr_writer :turn, :winner, :die

    def will_win?
      current_player.position + die >= grid.size
    end

    def increment_turn
      @turn += 1
    end

    def roll_die
      self.die = rand(1..6)
    end

    def rounds
      turn / players.size
    end
  end
end
