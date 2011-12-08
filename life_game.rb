class Grid
  attr_reader :height, :width
  def initialize(height, width, map)
    @height = height
    @width = width
    @map = map
  end

  def display
    @height.times do |i|
      @width.times do |j|
        print @map.include?([i, j]) ? "*" : "-"
      end
      print "\n"
    end
  end
end

grid = Grid.new(3, 3, [[0, 0], [0, 1], [1, 0]])
grid.display
