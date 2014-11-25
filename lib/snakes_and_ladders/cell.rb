module SnakesAndLadders
  class Cell
    attr_reader :location, :players

    def initialize(input)
      @location = input.fetch(:location)
      @players = []
    end

    def exit(player)
      evict player
    end

    def enter(player, board)
      admit player
      player.set_cell(self)
    end

  private

    def admit(player)
      players << player
    end

    def evict(player)
      players.delete(player)
    end
  end
end
