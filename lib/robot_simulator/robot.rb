module RobotSimulator
  class Robot
    def initialize(table, position)
      @position = position
      @move_forward = ::RobotSimulator::Services::MoveForward.new(table)
      @rotate_left = ::RobotSimulator::Services::RotateLeft.new
      @rotate_right = ::RobotSimulator::Services::RotateRight.new
    end

    def move_forward!
      @position = move_forward.call(position)
    end

    def rotate_left!
      @position = rotate_left.call(position)
    end

    def rotate_right!
      @position = rotate_right.call(position)
    end

    def report
      position.to_s
    end

    private

    attr_reader :position, :move_forward, :rotate_left, :rotate_right
  end
end
