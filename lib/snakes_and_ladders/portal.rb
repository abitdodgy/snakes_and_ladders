module SnakesAndLadders
  class Portal < Cell
    attr_reader :destination

    def initialize(input)
      @destination = input.fetch(:destination)
      super

      raise ArgumentError, "Location and destination can not be the same" if location.equal?(destination)
    end

    def enter(player, board)
      board.move player, location, destination
    end
  end
end
