module SnakesAndLadders
  class Grid
    attr_reader :size, :object_mappings, :default_object

    CLASSIC_BOARD_MAPPINGS = [
      { class: :Portal, location:  1, destination: 38  },
      { class: :Portal, location:  4, destination: 14  },
      { class: :Portal, location:  9, destination: 31  },
      { class: :Portal, location: 16, destination:  6  },
      { class: :Portal, location: 28, destination: 84  },
      { class: :Portal, location: 36, destination: 44  },
      { class: :Portal, location: 40, destination: 42  },
      { class: :Portal, location: 47, destination: 26  },
      { class: :Portal, location: 49, destination: 11  },
      { class: :Portal, location: 51, destination: 67  },
      { class: :Portal, location: 56, destination: 53  },
      { class: :Portal, location: 62, destination: 19  },
      { class: :Portal, location: 64, destination: 60  },
      { class: :Portal, location: 71, destination: 81  },
      { class: :Portal, location: 80, destination: 100 },
      { class: :Portal, location: 87, destination: 24  },
      { class: :Portal, location: 93, destination: 73  },
      { class: :Portal, location: 95, destination: 75  },
      { class: :Portal, location: 98, destination: 78  },
    ]

    def self.classic
      new(size: 100, object_mappings: CLASSIC_BOARD_MAPPINGS).build
    end

    def initialize(size:, object_mappings: [], default_object: :Cell)
      @size = size
      @object_mappings = object_mappings
      @default_object = default_object

      raise ArgumentError, "World size must be equal to or greater than its objects." if size < object_mappings.size
    end

    def build
      (1..size).each_with_object({}) do |index, grid|
        grid[index] = object_at(index)
      end
    end

  private

    def object_at(index)
      if object = object_mappings.detect { |object| object[:location].equal?(index) }
        klass = object.delete(:class)
        SnakesAndLadders.const_get(klass).new(object)
      else
        SnakesAndLadders.const_get(default_object).new(location: index)
      end
    end
  end
end
