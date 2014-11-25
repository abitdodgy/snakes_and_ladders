# SnakesAndLadders

### This is a work-in-progess, and not yet close to being ready.

This is an object oriented Ruby implementation of the classic [Snakes and Ladders][1] board game.

## Installation

Add this line to your application's Gemfile:

    gem 'snakes_and_ladders'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install snakes_and_ladders

## Usage

Create some players

````ruby
players = 2.times.each_with_object([]) { |n, array| SnakesAndLadders::Player.new(name: "Player #{n}") }
game = SnakesAndLadders::Game.new(players)
````

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


  [1]: http://en.wikipedia.org/wiki/Snakes_and_Ladders