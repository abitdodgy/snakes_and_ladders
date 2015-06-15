module SnakesAndLadders
  class Player
    attr_reader :name, :color, :die_rolls, :dice

    attr_accessor :position

    def initialize(name:, color:, position: 0, die_rolls: [], dice: Dice)
      @name = name
      @color = color
      @position = position
      @die_rolls = die_rolls
      @dice = Dice
    end

    def to_s
      name
    end

    def roll_die
      die_rolls.push(dice.roll).last
    end

    def turns
      die_rolls.size
    end

    def last_roll
      die_rolls.last
    end

    def destination_after_last_roll
      position + last_roll
    end
  end
end
