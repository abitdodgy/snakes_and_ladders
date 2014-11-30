module SnakesAndLadders
  class Player
    attr_reader :name, :color, :die_rolls

    attr_accessor :position

    def initialize(name:, color:, position: 0, die_rolls: [])
      @name = name
      @color = color
      @position = position
      @die_rolls = die_rolls
    end

    def to_s
      name
    end

    def roll_die
      puts "#{name} rolls die..."
      die_rolls.push(rand 1..6).last
    end

    def turns
      die_rolls.size
    end

    def last_roll
      die_rolls.last
    end

    def position_plus_last_roll
      position + last_roll
    end
  end
end
