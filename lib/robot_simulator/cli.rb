module RobotSimulator
  class Cli
    TABLE_WIDTH = 5
    TABLE_LENGTH = 5

    PLACE_COMMAND_PATTERN = /\APLACE (\d+),(\d+),(NORTH|EAST|SOUTH|WEST)\z/

    MOVE_COMMAND = 'MOVE'.freeze
    LEFT_COMMAND = 'LEFT'.freeze
    RIGHT_COMMAND = 'RIGHT'.freeze
    REPORT_COMMAND = 'REPORT'.freeze
    EXIT_COMMAND = 'q'.freeze

    SUCCESS_EXIT_CODE = 0

    BANNER_MESSAGE = 'Welcome to robot simulator!'.freeze
    EXIT_MESSAGE = 'Bye!'.freeze
    HELP_MESSAGE = <<-HELP_MESSAGE.freeze
    First of all place the robot on the table and after that you will be able to manipulate him.

    ROBOT COMMANDS:
      PLACE x,y,facing  - place robot on the table:
        x      - x coordinate of the table,
        y      - y coordinate of the table,
        facing - robot facing on the table, can be NORTH, EAST, SOUTH or WEST.
      MOVE              - move robot forward in facing direction.
      LEFT              - rotate robot 90 degrees left.
      RIGHT             - rotate robot 90 degrees right.
      REPORT            - print current robot position on the table.

    SYSTEM COMMANDS:
      q      - exit robot simulator.
    HELP_MESSAGE

    def initialize
      @table = ::RobotSimulator::Table.new(TABLE_WIDTH, TABLE_LENGTH)
    end

    def run
      print_banner

      loop do
        read_command
        execute_command
      end
    end

    private

    attr_reader :table, :robot, :command

    def read_command
      @command = readline.strip
    rescue Interrupt
      exit_app
    end

    # rubocop:disable Metrics/CyclomaticComplexity
    def execute_command
      return if command.empty?

      case command
      when PLACE_COMMAND_PATTERN then place_robot
      when MOVE_COMMAND then move_robot_forward
      when LEFT_COMMAND then rotate_robot_left
      when RIGHT_COMMAND then rotate_robot_right
      when REPORT_COMMAND then print_robot_report
      when EXIT_COMMAND then exit_app
      else print_help
      end
    end
    # rubocop:enable Metrics/CyclomaticComplexity

    def place_robot
      position = parse_robot_position
      return print_help unless table.include?(position)
      @robot = ::RobotSimulator::Robot.new(table, position)
    end

    def parse_robot_position
      x, y, facing = command.scan(PLACE_COMMAND_PATTERN).first
      ::RobotSimulator::Position.new(x.to_i, y.to_i, facing)
    end

    def move_robot_forward
      return print_help if robot.nil?
      robot.move_forward!
    end

    def rotate_robot_left
      return print_help if robot.nil?
      robot.rotate_left!
    end

    def rotate_robot_right
      return print_help if robot.nil?
      robot.rotate_right!
    end

    def print_robot_report
      return print_help if robot.nil?
      puts robot.report
    end

    def print_banner
      puts BANNER_MESSAGE
    end

    def print_help
      puts HELP_MESSAGE
    end

    def exit_app
      puts EXIT_MESSAGE
      exit(SUCCESS_EXIT_CODE)
    end
  end
end
