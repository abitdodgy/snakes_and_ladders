# SnakesAndLadders

This gem is a CLI clone of the classic board game [Snakes and Ladders][1] (or Chutes and Ladders). It's written in Ruby, and uses the Object-oriented programming paradigm.

This gem uses features only available in **Ruby 2.1** and above, such as *keyword arguments*, and *required keyword arguments*. You will need Ruby 2.1 to run this gem.

## Table of Contents
- [About the Game][game]
- [Installation][installation]
- [Playing the Game][playing]
- [Simulating Games][simulating]
- [Extensibility and Building Custom Boards][extensibility]
- [Rendering][rendering]
- [Contributing][contributing]

## About the Game

From the Snakes and Ladders [Wikipedia entry][1]:

>Snakes and Ladders is an ancient Indian board game regarded today as a worldwide classic. It is played between two or more players on a gameboard having numbered, gridded squares. A number of "ladders" and "snakes" are pictured on the board, each connecting two specific board squares. The object of the game is to navigate one's game piece, according to die rolls, from the start (bottom square) to the finish (top square), helped or hindered by ladders and snakes respectively. The historic version had root in morality lessons, where a player's progression up the board represented a life journey complicated by virtues (ladders) and vices (snakes).

This implementation is feature complete except for one rule: Rolling three sixes consecutively will not send you back to square one. Like the original, landing on or rolling in excess of the last square will cause you to win.

## Installation

Add this line to your application's Gemfile:

    gem 'snakes_and_ladders'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install snakes_and_ladders

## Playing

First, create some players. Unlike its physical counterpart, this implementation has no player limit; you can play with as many players as you want.

````ruby
peach = SnakesAndLadders.new_player(name: "Peach", color: "Pink")
luigi = SnakesAndLadders.new_player(name: "Luigi", color: "Green")
````

Now we need a game instance. The game ships with the classic board (based on Milton Bradley edition, 1952). You can create your own boards using the Grid class. A random board generator will soon become available.

````ruby
game = SnakesAndLadders.classic([peach, luigi])
````

Now let's roll the die to play.

````ruby
game.play_turn
# => Peach rolls 1.
# => Peach moves to square 1 and takes a ladder!
# => Peach is on square 38.
game.play_turn
# => Luigi rolls 5.
# ...
````

## Simulating Games

You can simulate entire games from start to finish without having to call `play_turn`. At any time you can call `game.simulate`, and the game will play itself to the end. You can simulate games before and after they have started.

````ruby
game.simulate
# => Peach rolls a 5!
# => Peach is on square 43.
# => Luigi rolls 2!
# => Luigi moves to square 80 and takes a ladder!
# => Luigi is on square 100.
# => Game over! Luigi wins in 14 turns. Congratulations!
````

## Extensibility

The game is fairly extensible and additional tiles to cell, snake, and ladder are pluggable. You can create additional tiles by inheriting from `SnakesAndLadders::Cell` and overriding the `enter` and `exit` methods where necessary.

````ruby
module SnakesAndLadders
  class Bowser < Cell
    def initialize(location: location)
      super
    end

    def enter(player, board)
      player.kidnap!
      puts "#{player} was kidnapped by evil Bower. Bwahahahaha!"
      super
    end
  end
end
````

In this example we created a new tile called Bowser. It kidnaps any player that lands on it. The implementation of kidnap is not important for the purpose of this example.

### Creating Custom Boards

Our Bowser tile is not going to use itself. We have to build a board and tell it where to place Bowser tiles. We can do this using the packaged builder. The `Grid` class is responsible for mounting new boards. It accepts an array of tile mappings.

````ruby
mappings = [
 { class: :Portal, location: 1, destination: 38 },
 { class: :Bowser, location: 5 },
 { class: :Portal, location: 16, destination: 6 },
 # ...
]
````

A mapping is just a hash of attributes that represent a tile. A mapping *must contain* `class` and `location` keys. You only have to create mappings for custom tiles. The grid will fill any missing locations with a normal `Cell` objects (this behaviour is also customisable by passing in a custom `default_tile` argument).

Our example mappings will produce the following board. The numbers denote tile numbers.

````
| 1. Portal | 2. Cell | 3. Cell | 4. Cell | 5. Bowser | 6. Cell ... | 16. Portal |
````

If you are wondering what `Portal` is, it's a class that represents snakes and ladders. Snakes and ladders have identical behaviour. Only their data differs. In the case of a snake, its destination is always smaller than its location. The opposite is true for ladders. So we can use the same class to represent both. You can think of them as portals because they transport players to other locations; *where to* is secondary.

Once we have our mappings we tell the grid to mount them.

````ruby
tiles = SnakesAndLadders::Grid.new(size: 100, tile_mappings: mappings).build
board = SnakesAndLadders::Board.new(grid: tiles)
game = SnakesAndLadders::Game.new(board: board, players: players)
````

Now our game will use our shiny new Bowser tile. Needless to say you should only create mappings for classes that you have built.

## Rendering

The game has no built in renderer. But any instance of Game contains all the information needed to render the game, so it's relatively easy to create your own render.

## Contributing

If you fancy a crack at creating a terminal renderer class, please go ahead. I'm also always looking for code reviews.

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


  [1]: http://en.wikipedia.org/wiki/Snakes_and_Ladders
  [game]: #about-the-game
  [installation]: #installation
  [playing]: #playing
  [simulating]: #simulating-games
  [extensibility]: #extensibility
  [rendering]: #rendering
  [contributing]: #contributing
