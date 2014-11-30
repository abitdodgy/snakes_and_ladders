module SnakesAndLadders
  class Cell
    attr_reader :location, :players

    def initialize(location:, players: [])
      @location = location
      @players = players
    end

    def exit(player)
      players.delete(player)
    end

    def enter(player, board)
      players.push(player) && player.position = location
      puts "#{player} is on square #{location}."
    end
  end
end
