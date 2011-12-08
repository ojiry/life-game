class Grid
  attr_reader :height, :width
  def initialize(height, width, map)
    @height = height
    @width = width
    @map = map
  end
end
