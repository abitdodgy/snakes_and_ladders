module SnakesAndLadders
  class World
    attr_reader :size, :snakes, :ladders

    def initialize(options = {})
      @size = options.fetch(:size)
      @snakes = options.fetch(:snakes)
      @ladders = options.fetch(:ladders)
    end

    def generate
      portals = (1..size - 1).to_a.shuffle.each_slice(2).map(&:sort).shift(portal_count)
      portals.shift(snakes).map!(&:reverse) + portals
    end

    def portal_count
      snakes + ladders
    end
  end
end
