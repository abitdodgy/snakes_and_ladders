def build_player(options = { name: "Mario", color: "Red"})
  SnakesAndLadders::Player.new(options)
end

def build_grid(size = 10)
  (1..size).each_with_object({}) do |index, grid|
    grid[index] = SnakesAndLadders::Cell.new(location: index)
  end
end
