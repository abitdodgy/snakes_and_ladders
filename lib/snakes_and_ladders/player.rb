module SnakesAndLadders
  class Player
    attr_reader :name, :color

    attr_accessor :current_cell

    def initialize(input)
      @name = input.fetch(:name)
      @color = input.fetch(:color)
    end

    def first_turn?
      !!location
    end

    def to_s
      name
    end

    def roll_dice
      rand(1..6)
    end

    def set_cell(cell)
      self.current_cell = cell
    end

    def position
      current_cell ? current_cell.location : 0
    end
  end
end
