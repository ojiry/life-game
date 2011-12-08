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

  def next
    Grid.new(@height, @width, nil)
  end

  def around_count(x, y)
    count = 0
    [y - 1, y, y + 1].each do |i|
      [x - 1, x, x + 1].each do |j|
        count = count + 1 if @map.include?([i, j])
      end
    end
    count
  end
end

grid = Grid.new(3, 3, [[0, 0], [0, 1], [1, 0]])
grid.display
