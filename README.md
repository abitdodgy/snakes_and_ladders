# SnakesAndLadders

This gem is an Object Oriented implementation in Ruby of the classic [Snakes and Ladders][1] board game. The game is also known as Chutes and Ladders.

While the game is still under development, it's almost feature complete.

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

## Installation

Add this line to your application's Gemfile:

    gem 'snakes_and_ladders'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install snakes_and_ladders

## Playing

First, let's create some players. Unlike its physical counter part, this implementation has no player limit; you can play with as many players as you want.

````ruby
peach = SnakesAndLadders.new_player(name: "Peach", color: "Pink")
luigi = SnakesAndLadders.new_player(name: "Luigi", color: "Green")
````
Now we need a game. Let's create a game instance. The game ships with the classic board (based on Milton Bradley edition, 1952). You can also create your own board using the world builder. A random world generator will soon become available.

````ruby
players = [peach, luigi]
game = SnakesAndLadders.classic(players)
````

Now roll the die to play.

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
# => Luigi rolls 2!
# => Luigi moves to square 80 and takes a ladder!
# => Luigi is on square 100.
# => Game over! Luigi wins in 14 turns. Congratulations!
````

## Extensibility

The game is fairly extensible and additional tiles (to normal cell, and snake and ladder tiles) are pluggable. You can create additional tiles by inheriting from `SnakesAndLadders::Cell` and overriding the `enter` and `exit` methods where necessary.

````ruby
class Bowser < Cell
  def initialize(location: location)
    super(location: location)
  end

  def enter(player, board)
    player.kidnap!
    puts "#{player} was kidnapped by evil Bower. Bwahahahaha!"
  end
end
````

In this example we created a new tile called Bowser. It kidnaps any player that lands on it. The implementation of kidnap is not important.

### Creating Custom Boards

Our `Bowser` tile is not going to use itself. We have to build a board that uses it. We can do this using the packaged builder. The `Grid` class is responsible for mounting new boards. It accepts an array of tile mappings.

````ruby
mappings = [
 { class: :Portal, location: 1, destination: 38 },
 { class: :Bowser, location: 5 },
 { class: :Portal, location: 16, destination: 6 },
 # ...
]
````

A mapping is just a hash of attributes that represent a tile. A mapping *must contain* `class` and `location` keys. You only have to create mappings for custom tiles. The builder will fill any missing locations with a normal `Cell` objects (this behaviour is also customisable by passing in a custom `default_tile` argument).

Our example mappings will produce the following board. The numbers denote tile numbers.

````
| 1. Portal | 2. Cell | 3. Cell | 4. Cell | 5. Bowser | 6. Cell ... | 16. Portal |
````

If you are wondering what a `Portal` is, it's a class that represents snakes and ladders. Snakes and ladders have identical behaviour. Only their data differs. In the case of a snake, it's destination is always smaller than it's location. The opposite is true for ladders. So we can use the same class to represent both.

Once we have our mappings we tell the grid to mount them.

````ruby
tiles = SnakesAndLadders::Grid.new(size: 100, tile_mappings: mappings)
board = SnakesAndLadders::Board.new(grid: tiles)
game = SnakesAndLadders::Game.new(board: board, players: players)
````

Now our game will use our shiny new Bowser tile.

## Rendering

The game has no built in renderer. But any instance of Game contains all the information needed to render the game, so it's relatively easy to create your own render.

## Contributing

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
