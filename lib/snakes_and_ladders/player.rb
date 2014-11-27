module SnakesAndLadders
  class Player
    attr_reader :name, :color

    attr_accessor :cell

    def initialize(options)
      @name = options.fetch(:name)
      @color = options.fetch(:color)
    end

    def to_s
      name
    end

    def position
      cell ? cell.location : 0
    end
  end
end
