module SnakesAndLadders
  class TurnManager
    attr_reader :players

    attr_accessor :counter

    def initialize(players: [], counter: 0)
      @players = players
      @counter = counter
    end

    def next_player
      player = players.at(counter % players.size)
      self.counter += 1
      player
    end
  end
end
