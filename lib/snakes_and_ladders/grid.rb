module SnakesAndLadders
  class Grid
    attr_reader :size, :portals

    CLASSIC_BOARD = [
      [16,  6], [47, 26], [49, 11], [56, 53], [62, 19], [64, 60], [87, 24], [93, 73], [95, 75], [98, 78],
      [ 1, 38], [ 4, 14], [ 9, 31], [28, 84], [36, 44], [40, 42], [51, 67], [71, 81], [80, 100]
    ]

    def initialize(options = {})
      @size = options.fetch(:size)
      @portals = options.fetch(:portals, [])
    end

    def build
      (1..size).each_with_object({}) do |index, grid|
        grid[index] =
          if portal = portal_at(index)
            SnakesAndLadders::Portal.new(location: portal.first, destination: portal.last)
          else
            SnakesAndLadders::Cell.new(location: index)
          end
      end
    end

  private

    def portal_at(index)
      portals.detect { |portal| portal.first.equal?(index) }
    end
  end
end
