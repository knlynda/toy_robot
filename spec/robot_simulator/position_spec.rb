require 'spec_helper'

describe RobotSimulator::Position do
  describe '#to_s' do
    subject { described_class.new.to_s }
    it { is_expected.to eq '0,0,NORTH' }
  end

  describe '#facing_north?' do
    subject { described_class.new(0, 0, facing).facing_north? }

    context 'when facing NORTH' do
      let(:facing) { 'NORTH' }
      it { is_expected.to be_truthy }
    end

    %w[EAST SOUTH WEST UNKNOWN].each do |facing|
      context "when facing #{facing}" do
        let(:facing) { facing }
        it { is_expected.to be_falsey }
      end
    end
  end

  describe '#facing_east?' do
    subject { described_class.new(0, 0, facing).facing_east? }

    context 'when facing EAST' do
      let(:facing) { 'EAST' }
      it { is_expected.to be_truthy }
    end

    %w[NORTH SOUTH WEST UNKNOWN].each do |facing|
      context "when facing #{facing}" do
        let(:facing) { facing }
        it { is_expected.to be_falsey }
      end
    end
  end

  describe '#facing_south?' do
    subject { described_class.new(0, 0, facing).facing_south? }

    context 'when facing SOUTH' do
      let(:facing) { 'SOUTH' }
      it { is_expected.to be_truthy }
    end

    %w[NORTH EAST WEST UNKNOWN].each do |facing|
      context "when facing #{facing}" do
        let(:facing) { facing }
        it { is_expected.to be_falsey }
      end
    end
  end

  describe '#facing_west?' do
    subject { described_class.new(0, 0, facing).facing_west? }

    context 'when facing WEST' do
      let(:facing) { 'WEST' }
      it { is_expected.to be_truthy }
    end

    %w[NORTH EAST SOUTH UNKNOWN].each do |facing|
      context "when facing #{facing}" do
        let(:facing) { facing }
        it { is_expected.to be_falsey }
      end
    end
  end
end
