module SnakesAndLadders
  class GameBoard
    attr_reader :grid, :size

    def initialize(grid: {}, size: 100)
      @grid = grid
      @size = size
    end

    def [](location)
      grid[location]
    end

    def []=(location, value)
      if location.x < 1 || location.x > size
        return nil
      else
        grid[location] = value
      end
    end
  end
end
