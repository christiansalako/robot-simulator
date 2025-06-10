# frozen_string_literal: true

require_relative 'table'
require_relative 'robot'
require_relative 'command_processor'
require_relative 'toy_robot_programme'


class ToyRobotProgramme
  def initialize
    @table = Table.new()
    @robot = Robot.new(@table)
    @command_processor = CommandProcessor.new(@robot)
  end

  def run
    puts '==================================='
    puts '       TOY ROBOT PROGRAMME         '
    puts '==================================='

    puts '- PLACE X,Y,F (example: PLACE 0,0,NORTH)'
    puts '- MOVE'
    puts '- LEFT'
    puts '- RIGHT'
    puts '- REPORT'
    puts '- EXIT (quits the programme)'
    puts '==================================='

    loop do
      print '> '

      input = gets.chomp.strip.upcase
      break if input == 'EXIT' || input == 'exit'

      @command_processor.process(input)
    end

    puts 'Exiting Robot programme. Adios!'
  end
end

simulator = ToyRobotProgramme.new
simulator.run