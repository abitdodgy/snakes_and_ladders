require "snakes_and_ladders/board"
require "snakes_and_ladders/grid"
require "snakes_and_ladders/world"
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
    grid = Grid.new(size: 100, portals: Grid::CLASSIC_BOARD).build
    SnakesAndLadders::Board.new(grid: grid)
  end

  def self.random(options = {})
    options = { size: 100 }.merge(options)
    portals = World.new(options).generate
    grid = Grid.new(size: 100, portals: portals).build
    SnakesAndLadders::Board.new(grid: grid)
  end
end
