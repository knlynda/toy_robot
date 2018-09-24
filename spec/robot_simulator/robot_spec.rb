require 'spec_helper'

describe RobotSimulator::Robot do
  let(:robot) { described_class.new(table, position) }
  let(:position) { RobotSimulator::Position.new }
  let(:table) { RobotSimulator::Table.new }

  describe '#move_forward!' do
    let(:move_forward_service) { instance_double(RobotSimulator::Services::MoveForward) }

    it 'calls MoveForward service' do
      expect(RobotSimulator::Services::MoveForward).to receive(:new).with(table).once.and_return(move_forward_service)
      expect(move_forward_service).to receive(:call).with(position).once

      robot.move_forward!
    end
  end

  describe '#rotate_left!' do
    let(:rotate_left_service) { instance_double(RobotSimulator::Services::RotateLeft) }

    it 'calls RotateLeft service' do
      expect(RobotSimulator::Services::RotateLeft).to receive(:new).once.and_return(rotate_left_service)
      expect(rotate_left_service).to receive(:call).with(position).once

      robot.rotate_left!
    end
  end

  describe '#rotate_right!' do
    let(:rotate_right_service) { instance_double(RobotSimulator::Services::RotateRight) }

    it 'calls RotateRight service' do
      expect(RobotSimulator::Services::RotateRight).to receive(:new).once.and_return(rotate_right_service)
      expect(rotate_right_service).to receive(:call).with(position).once

      robot.rotate_right!
    end
  end

  describe '#report' do
    it 'calls to_s on position' do
      expect(position).to receive(:to_s).once

      robot.report
    end
  end
end
