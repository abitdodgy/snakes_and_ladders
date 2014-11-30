module SnakesAndLadders
  class Board
    attr_reader :grid

    def initialize(grid: Grid.classic)
      @grid = grid
    end

    def move(player, from, to)
      if destination = get_cell(to)
        if location = get_cell(from)
          location.exit(player)
        end
        destination.enter(player, self)
      end
    end

    def get_cell(index)
      grid[index]
    end

    def size
      grid.size
    end
  end
end
