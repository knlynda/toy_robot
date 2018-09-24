require 'spec_helper'

describe RobotSimulator::Table do
  describe '#include?' do
    subject { described_class.new(5, 5).include?(position) }

    [
      RobotSimulator::Position.new(0, 0),
      RobotSimulator::Position.new(0, 4),
      RobotSimulator::Position.new(4, 4),
      RobotSimulator::Position.new(4, 0),
      RobotSimulator::Position.new(2, 2)
    ].each do |position|
      context "when position #{position}" do
        let(:position) { position }
        it { is_expected.to be_truthy }
      end
    end

    [
      RobotSimulator::Position.new(-1, 2),
      RobotSimulator::Position.new(2, -1),
      RobotSimulator::Position.new(-1, -1),
      RobotSimulator::Position.new(5, 5)
    ].each do |position|
      context "when position #{position}" do
        let(:position) { position }
        it { is_expected.to be_falsey }
      end
    end
  end
end
