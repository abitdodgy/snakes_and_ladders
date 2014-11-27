module SnakesAndLadders
  class Portal < Cell
    attr_reader :destination

    def initialize(options)
      @destination = options.fetch(:destination)
      super

      raise ArgumentError, "Location and destination can not be the same" if location.equal?(destination)
    end

    def enter(player, board)
      puts "#{player} takes a #{type} to #{destination}"
      board.move(player, location, destination)
    end

    def type
      location > destination ? :snake : :ladder
    end
  end
end
