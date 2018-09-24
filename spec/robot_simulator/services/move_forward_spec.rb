require 'spec_helper'

describe RobotSimulator::Services::MoveForward do
  describe '#call' do
    {
      RobotSimulator::Position.new(0, 0, 'NORTH') => RobotSimulator::Position.new(0, 1, 'NORTH'),
      RobotSimulator::Position.new(0, 4, 'EAST')  => RobotSimulator::Position.new(1, 4, 'EAST'),
      RobotSimulator::Position.new(4, 4, 'SOUTH') => RobotSimulator::Position.new(4, 3, 'SOUTH'),
      RobotSimulator::Position.new(4, 0, 'WEST')  => RobotSimulator::Position.new(3, 0, 'WEST'),
      RobotSimulator::Position.new(0, 0, 'WEST')  => RobotSimulator::Position.new(0, 0, 'WEST'),
      RobotSimulator::Position.new(0, 4, 'NORTH') => RobotSimulator::Position.new(0, 4, 'NORTH'),
      RobotSimulator::Position.new(4, 4, 'EAST')  => RobotSimulator::Position.new(4, 4, 'EAST'),
      RobotSimulator::Position.new(4, 0, 'SOUTH') => RobotSimulator::Position.new(4, 0, 'SOUTH')
    }.each do |initial_position, result_position|
      context "when position #{initial_position}" do
        subject { described_class.new(RobotSimulator::Table.new(5, 5)).call(initial_position) }
        it { is_expected.to eq(result_position) }
      end
    end
  end
end
