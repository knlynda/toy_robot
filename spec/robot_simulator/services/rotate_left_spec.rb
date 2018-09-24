require 'spec_helper'

describe RobotSimulator::Services::RotateLeft do
  describe '#call' do
    {
      RobotSimulator::Position.new(0, 0, 'NORTH') => RobotSimulator::Position.new(0, 0, 'WEST'),
      RobotSimulator::Position.new(0, 0, 'EAST')  => RobotSimulator::Position.new(0, 0, 'NORTH'),
      RobotSimulator::Position.new(0, 0, 'SOUTH') => RobotSimulator::Position.new(0, 0, 'EAST'),
      RobotSimulator::Position.new(0, 0, 'WEST')  => RobotSimulator::Position.new(0, 0, 'SOUTH')
    }.each do |initial_position, result_position|
      context "when position #{initial_position}" do
        subject { described_class.new.call(initial_position) }
        it { is_expected.to eq(result_position) }
      end
    end
  end
end
