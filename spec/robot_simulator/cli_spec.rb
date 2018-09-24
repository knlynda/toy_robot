require 'spec_helper'

describe RobotSimulator::Cli do
  let(:cli) { described_class.new }

  describe '#run' do
    it 'prints banner' do
      allow(cli).to receive(:loop)
      expect { cli.run }.to output(/Welcome to robot simulator!/).to_stdout

      cli.run
    end

    context 'with commands' do
      before do
        allow(cli).to receive(:loop).and_yield
        allow(cli).to receive(:readline).and_return(command)
      end

      context 'PLACE' do
        let(:command) { 'PLACE 1,2,NORTH' }
        before { allow(cli).to receive(:table) { table } }

        context 'when on the table' do
          let(:table) { instance_double(RobotSimulator::Table, include?: true) }
          let(:position) { RobotSimulator::Position.new(1, 2, 'NORTH') }

          it 'places robot' do
            expect(RobotSimulator::Robot).to receive(:new).with(table, position).once
            cli.run
          end
        end

        context 'when out of the table' do
          let(:table) { instance_double(RobotSimulator::Table, include?: false) }

          it 'prints help message' do
            expect(RobotSimulator::Robot).to_not receive(:new)
            expect(cli).to receive(:print_banner).once
            expect(cli).to receive(:print_help).once
            cli.run
          end
        end
      end

      {
        MOVE: :move_forward!,
        LEFT: :rotate_left!,
        RIGHT: :rotate_right!,
        REPORT: :report
      }.each do |app_command, robot_method|
        context app_command.to_s do
          let(:command) { app_command.to_s }
          before { allow(cli).to receive(:robot) { robot } }

          context 'with robot' do
            let(:robot) { instance_double(RobotSimulator::Robot) }

            it 'moves robot' do
              expect(robot).to receive(robot_method).once
              cli.run
            end
          end

          context 'without robot' do
            let(:robot) { nil }

            it 'prints help message' do
              expect(cli).to receive(:print_help).once
              cli.run
            end
          end
        end
      end

      context 'q' do
        let(:command) { 'q' }

        it 'prints exit message' do
          expect(cli).to receive(:exit_app).once
          cli.run
        end
      end
    end
  end
end
