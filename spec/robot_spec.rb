require 'rspec'
require_relative '../table'
require_relative '../robot'

describe Robot do
  let(:table) { Table.new }
  let(:robot) { Robot.new(table) }

  context '#place' do
    it 'places robot at valid position' do
      position = robot.place(1, 2, 'NORTH')

      expect(robot.x).to eq(1)
      expect(robot.y).to eq(2)
      expect(robot.f).to eq('NORTH')

      expect(robot.placed?).to be true
    end

    it 'rejects invalid position' do
      position = robot.place(-1, 6, 'NORTH')

      expect(position).to eq('Command not placed yet')
      expect(robot.placed?).to be false
    end

    it 'rejects invalid direction' do
        position = robot.place(2, 2, 'nort-or-west')

      expect(position).to eq('Command not placed yet')
      expect(robot.placed?).to be false
    end
  end

  context '#move' do
    context 'when robot is not placed' do
      it 'returns error message' do
        expect(robot.move).to eq('Command not placed yet')
      end
    end

    context 'when robot is placed' do
      before { robot.place(2, 2, 'NORTH') }

      it 'moves robot north' do
        robot.move

        expect(robot.x).to eq(2)
        expect(robot.y).to eq(3)
      end

      it 'moves robot east' do
        robot.place(2, 2, 'EAST')
        robot.move

        expect(robot.x).to eq(3)
        expect(robot.y).to eq(2)
      end

      it 'prevents robtot falling off the table' do
        robot.place(0, 0, 'SOUTH')

        expect(robot.move).to be false
        expect(robot.x).to eq(0)
        expect(robot.y).to eq(0)
      end
    end
  end

  context '#report' do
    it 'reports correct position and direction' do
      robot.place(3, 4, 'WEST')
      expect(robot.report).to eq('3,4,WEST')
    end
  end
end