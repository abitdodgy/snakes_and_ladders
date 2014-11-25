module SnakesAndLadders
  class Board
    attr_reader :grid, :players

    attr_accessor :turn, :winner

    def initialize(input = {})
      @grid = input.fetch(:grid, default_grid)
      @players = []
      @turn = 0
    end

    def add_player(player)
      players << player
    end

    def get_cell(index)
      grid[index]
    end

    def move(player, from, to)
      get_cell(from).exit player unless player.first_turn?
      get_cell(to).enter player, self
    end

    def play_turn
      return if game_over?

      roll = current_player.roll_dice

      if won?(roll)
        self.winner = current_player
      else
        move current_player, current_player.position, current_player.position + roll
        increment_turn
        puts "#{current_player} rolls #{roll} and moves from #{current_player.position} to #{current_player.position}"
      end
    end

    def game_over?
      !!winner
    end

  private

    def default_grid
      Array.new(100)
    end

    def current_player
      players.fetch(turn % players.size)
    end

    def won?(last_roll)
      (current_player.position + 1 + last_roll) >= grid.size
    end

    def increment_turn
      self.turn += 1
    end

    def game_started?
      turn > 0
    end
  end
end
