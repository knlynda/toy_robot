module RobotSimulator
  class Table
    attr_reader :width, :length

    def initialize(width = 5, length = 5)
      @width = width
      @length = length
    end

    def include?(position)
      (0..width - 1).cover?(position.x) && (0..length - 1).cover?(position.y)
    end
  end
end
