module SnakesAndLadders
  class Location
    attr_reader :x

    def initialize(x)
      @x = x
    end

    def ==(other)
      x == other.x
    end

    def eql?(other)
      self.==(other)
    end

  private

    def hash
      x.hash
    end
  end
end
