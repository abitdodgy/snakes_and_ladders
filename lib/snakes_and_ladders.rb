require "snakes_and_ladders/game"
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
  def self.classic(players)
    SnakesAndLadders::Game.new(board: SnakesAndLadders::Board.new, players: players)
  end
end
