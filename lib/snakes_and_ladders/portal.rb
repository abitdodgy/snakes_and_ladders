module SnakesAndLadders
  class Portal < Cell
    attr_reader :destination

    def initialize(location:, destination:)
      @destination = destination
      super(location: location)

      raise ArgumentError, "Location and destination can not be equal" if location.equal?(destination)
    end

    def enter(player, board)
      puts "#{player} moves to square #{location} and takes a #{type}!"
      board.move(player, location, destination)
    end

    def type
      location > destination ? :snake : :ladder
    end
  end
end
