require "snakes_and_ladders/board"
require "snakes_and_ladders/cell"
require "snakes_and_ladders/portal"
require "snakes_and_ladders/player"
require "snakes_and_ladders/version"

begin
  require "pry"
rescue LoadError
end

module SnakesAndLadders

  def self.classic
    portals = [
      [16,  6], [47, 26], [49, 11], [56, 53], [62, 19], [64, 60], [87, 24], [93, 73], [95, 75], [98, 78],
      [ 1, 38], [ 4, 14], [ 9, 31], [28, 84], [36, 44], [40, 42], [51, 67], [71, 81], [80, 100]
    ]

    portals.collect! { |portal| [portal.first - 1, portal.last - 1] }

    grid = Array.new(100) do |element|
      if portal = portals.detect { |portal| portal.first.equal?(element) }
        SnakesAndLadders::Portal.new(location: portal.first, destination: portal.last)
      else
        SnakesAndLadders::Cell.new(location: element)
      end
    end

    Board.new(grid: grid)
  end
end
