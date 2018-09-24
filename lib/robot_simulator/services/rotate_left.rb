module RobotSimulator
  module Services
    class RotateLeft
      def call(position)
        ::RobotSimulator::Position.new(
          position.x,
          position.y,
          calculate_facing(position)
        )
      end

      private

      def calculate_facing(position)
        return ::RobotSimulator::Position::WEST if position.facing_north?
        return ::RobotSimulator::Position::NORTH if position.facing_east?
        return ::RobotSimulator::Position::EAST if position.facing_south?
        return ::RobotSimulator::Position::SOUTH if position.facing_west?
        position.facing
      end
    end
  end
end
