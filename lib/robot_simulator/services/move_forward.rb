module RobotSimulator
  module Services
    class MoveForward
      def initialize(table)
        @table = table
      end

      def call(position)
        ::RobotSimulator::Position.new(
          calculate_x(position),
          calculate_y(position),
          position.facing
        )
      end

      private

      attr_reader :table

      def calculate_x(position)
        return position.x + 1 if position.facing_east? && position.x < table.width - 1
        return position.x - 1 if position.facing_west? && position.x.positive?
        position.x
      end

      def calculate_y(position)
        return position.y + 1 if position.facing_north? && position.y < table.length - 1
        return position.y - 1 if position.facing_south? && position.y.positive?
        position.y
      end
    end
  end
end
