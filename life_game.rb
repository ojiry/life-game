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
        live = @map.include?([i, j])
        count = around_count(j, i)
        if live
          array << [i, j] if count == 2 || count == 3
        else
          array << [i, j] if count == 3
        end
      end
    end
    Grid.new(@height, @width, array)
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
4.times do
  grid = grid.next
  grid.display
end
