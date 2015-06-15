module SnakesAndLadders
  class Location
    alias_method :eql?, :==
    attr_reader :x

    def initialize(x)
      @x = x
    end

    def ==(other)
      x == other.x
    end
  end
end
