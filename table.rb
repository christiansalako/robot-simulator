# frozen_string_literal: true

class Table
  # ensure table has 5x 5 dimensions
  def initialize(width = 5, height = 5)
    @width = width
    @height = height
  end

  def valid_command?(x, y)
    x >= 0 && x < @width && y >= 0 && y < @height
  end
end
