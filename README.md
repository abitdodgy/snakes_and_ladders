# SnakesAndLadders

### This gem is a work in progress.

This gem is an object oriented Ruby implementation of the classic [Snakes and Ladders][1] board game. The game is also known as Chutes and Ladders.

## Table of Contents
- [About the Game][game]
- [Installation][instalation]
- [Playing the Game][playing]
- [Simulating Games][simulating]
- [Using the World Builder][world]
- [Extensibility][extensibility]
- [Rendering][rendering]


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

The game is represented by a board. The classic board (based on Milton Bradley edition, 1952) is available out of the box. You can also create your own board, or a random board using the packaged world builder (more on that below).

````ruby
board = SnakesAndLadders.classic
````

To play we need players!

````ruby
peach = SnakesAndLadders::Player.new(name: "Peach", color: "Pink")
luigi = SnakesAndLadders::Player.new(name: "Luigi", color: "Green")
board.add_player(peach)
board.add_player(luigi)
````

Now roll the die to play.

````ruby
board.play_turn
# => Peach rolls 1 and moves from 0 to 1.
# => Peach takes a ladder to 38.
# => It's Luigi's turn!
````

### Simulating games

You can simulate entire games from start to finish without having to call `play_turn`. At any time you can call `board.simulate`, and the game will play itself to the end. You can simulate games before and after they have started.

````ruby
board = SnakesAndLadders.classic
mario = SnakesAndLadders::Player.new(name: "Mario", color: "Red")
board.add_player(mario)
board.simulate
````

### Extensibility

The game is fairly extensible and additional features (to snakes and ladders) are pluggable. You can create additional features by inheriting from `SnakesAndLadders::Cell` and overriding the `enter` and `exit` methods where necessary.

In this example we create a new feature (tile) called Bowser. It kidnaps any player that lands on it. The implementation of kidnap is not important.

````ruby
class Bowser < Cell

  def initialize(options)
    super
  end

  def enter(player, board)
    player.kidnap!
  end
end
````

Unfortunately, as of this release, the world builder is tightly coupled with features. It only knows how to create snakes and ladders. To add features you must compose the grid manually, or modify the world builder to accept any type of feature.

### Rendering

The game has no built in renderer. But any instance of Board contains all the information needed to render the game.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


  [1]: http://en.wikipedia.org/wiki/Snakes_and_Ladders
  [game]: #about-the-game
  [installation]: #installation
  [playing]: #playing-the-game

   If you land at the base of a ladder you climb to the square that the ladder reaches to.If you land at the head of a snake you slide down to the square that the snake reaches to.