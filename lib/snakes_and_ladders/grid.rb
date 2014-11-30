module SnakesAndLadders
  class Grid
    attr_reader :size, :tile_mappings, :default_tile

    CLASSIC_BOARD_MAPPINGS = [
      { class: :Portal, location:  1, destination:  38 },
      { class: :Portal, location:  4, destination:  14 },
      { class: :Portal, location:  9, destination:  31 },
      { class: :Portal, location: 16, destination:   6 },
      { class: :Portal, location: 28, destination:  84 },
      { class: :Portal, location: 36, destination:  44 },
      { class: :Portal, location: 40, destination:  42 },
      { class: :Portal, location: 47, destination:  26 },
      { class: :Portal, location: 49, destination:  11 },
      { class: :Portal, location: 51, destination:  67 },
      { class: :Portal, location: 56, destination:  53 },
      { class: :Portal, location: 62, destination:  19 },
      { class: :Portal, location: 64, destination:  60 },
      { class: :Portal, location: 71, destination:  81 },
      { class: :Portal, location: 80, destination: 100 },
      { class: :Portal, location: 87, destination:  24 },
      { class: :Portal, location: 93, destination:  73 },
      { class: :Portal, location: 95, destination:  75 },
      { class: :Portal, location: 98, destination:  78 },
    ]

    def self.classic
      mappings = Marshal.load(Marshal.dump(CLASSIC_BOARD_MAPPINGS))
      new(size: 100, tile_mappings: mappings).build
    end

    def initialize(size:, tile_mappings: [], default_tile: :Cell)
      @size = size
      @tile_mappings = tile_mappings
      @default_tile = default_tile

      raise ArgumentError, "Board size must be equal to or greater than its tiles." if size < tile_mappings.size
    end

    def build
      (1..size).each_with_object({}) { |index, grid| grid[index] = tile_at(index) }
    end

  private

    def tile_at(index)
      if mapping = tile_mappings.detect { |tile_map| tile_map[:location].equal?(index) }
        klass = mapping.delete(:class)
        SnakesAndLadders.const_get(klass).new(mapping)
      else
        SnakesAndLadders.const_get(default_tile).new(location: index)
      end
    end
  end
end
