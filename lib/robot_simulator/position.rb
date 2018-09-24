module RobotSimulator
  class Position
    NORTH = 'NORTH'.freeze
    EAST = 'EAST'.freeze
    SOUTH = 'SOUTH'.freeze
    WEST = 'WEST'.freeze

    attr_reader :x, :y, :facing

    def initialize(x = 0, y = 0, facing = NORTH)
      @x = x
      @y = y
      @facing = facing
    end

    def to_s
      "#{x},#{y},#{facing}"
    end

    def ==(other)
      other.x == x && other.y == y && other.facing == facing
    end

    def facing_north?
      facing == NORTH
    end

    def facing_east?
      facing == EAST
    end

    def facing_south?
      facing == SOUTH
    end

    def facing_west?
      facing == WEST
    end
  end
end
