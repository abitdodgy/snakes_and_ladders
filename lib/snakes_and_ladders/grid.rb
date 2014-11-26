module SnakesAndLadders
  class Grid
    attr_reader :size, :portals

    def initialize(options = {})
      @size = options.fetch(:size)
      @portals = options.fetch(:portals)
    end

    def build
      (1..size).each_with_object({}) do |index, grid|
        grid[index] =
          if portal = portals.detect { |portal| portal.first.equal?(index) }
            SnakesAndLadders::Portal.new(location: portal.first, destination: portal.last)
          else
            SnakesAndLadders::Cell.new(location: index)
          end
      end
    end
  end
end
