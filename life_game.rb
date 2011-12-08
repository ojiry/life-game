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
    array = []
    @height.times do |i|
      @width.times do |j|
        if @map.include?([i, j])
          array << [i, j] if [2, 3].include?(around_count(j, i))
        else
          array << [i, j] if around_count(j, i) == 3
        end
      end
    end
    Grid.new(@height, @width, array)
  end

  def around_count(x, y)
    count = 0
    [y - 1, y, y + 1].each do |i|
      [x - 1, x, x + 1].each do |j|
        count += 1 if @map.include?([i, j]) && !(i == y && j == x)
      end
    end
    count
  end
end

grid = Grid.new(4, 4, [[0, 0], [0, 1], [1, 0], [2, 3], [3, 2], [3, 3]])
grid.display
5.times do
  grid = grid.next
  grid.display
end
