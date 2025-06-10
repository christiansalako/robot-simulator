# frozen_string_literal: true

class Robot
  attr_reader :x, :y, :f

  DIRECTIONS = %w[NORTH EAST SOUTH WEST].freeze

  LEFT = {
    'NORTH' => 'WEST',
    'WEST' => 'SOUTH',
    'SOUTH' => 'EAST',
    'EAST' => 'NORTH'
  }.freeze

  RIGHT = {
    'NORTH' => 'EAST',
    'EAST' => 'SOUTH',
    'SOUTH' => 'WEST',
    'WEST' => 'NORTH'
  }.freeze

  def initialize(table)
    @table = table
    @command_been_placed = false
  end

  # user must use this command first
  def place(x, y, f)
    return 'Command not placed yet' unless @table.valid_command?(x, y) && DIRECTIONS.include?(f)

    @x = x
    @y = y
    @f = f
    @command_been_placed = true

    "Robots new position x:#{@x}, y:#{@y} f:#{@f}"
  end

  # moves the robot ONLY one unit in the direction it is facing
  def move
    return 'Command not placed yet' unless @command_been_placed

    new_x, new_y = next_position

    if @table.valid_command?(new_x, new_y)
      @x = new_x
      @y = new_y
      true
    else
      false
    end
  end

  # rotates robot 90 degrees counterclockwise
  def left
    return 'Command not placed yet' unless @command_been_placed

    @f = LEFT[@f]
    "Robot turned left to face #{@f}"
  end

  # rotates robot 90 degrees clockwise
  def right
    return 'Command not placed yet' unless @command_been_placed

    @f = RIGHT[@f]
    "Robot turned right to face #{@f}"
  end

  # reports robt current position
  def report
    return 'Command not placed yet' unless @command_been_placed

    "#{@x},#{@y},#{@f}"
  end

  def placed?
    @command_been_placed
  end

  private

  # calculates the next position
  def next_position
    case @f
    when 'NORTH'
      [@x, @y + 1]  # Move up (y increases)
    when 'EAST'
      [@x + 1, @y]  # Move right (x increases)
    when 'SOUTH'
      [@x, @y - 1]  # Move down (y decreases)
    when 'WEST'
      [@x - 1, @y]  # Move left (x decreases)
    end
  end
end
