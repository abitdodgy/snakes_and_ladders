module SnakesAndLadders
  class Player
    attr_reader :name, :color

    attr_accessor :position

    def initialize(input)
      @name = input.fetch(:name)
      @color = input.fetch(:color)
      @position = 0
    end

    def to_s
      name
    end
  end
end
