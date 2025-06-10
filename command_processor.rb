# frozen_string_literal: true

class CommandProcessor
  def initialize(robot)
    @robot = robot
  end

  def process(command)
    if command.start_with?('PLACE ')
      args = command[6..].split(',')
      # ensure user input correct number of arguments
      # args should be in the format: PLACE X,Y,DIRECTION
      return false unless args.length == 3

      x = args[0].to_i
      y = args[1].to_i
      direction = args[2]

      @robot.place(x, y, direction)
    elsif !@robot.placed?
      puts "Robot hasn't moved yet. Use PLACE commnad first"
      false
    elsif command == 'MOVE'
      result = @robot.move
      puts 'Cannot move in that direction - you would cause considerble damage to your your robot!' unless result
      result
    elsif command == 'LEFT'
      @robot.left
    elsif command == 'RIGHT'
      @robot.right
    elsif command == 'REPORT'
      puts @robot.report
      true
    else
      puts "Invalid command: #{command}"
      false
    end
  end
end
