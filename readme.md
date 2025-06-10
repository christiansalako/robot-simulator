# Toy Robot Simulator

A Ruby application that simulates a toy robot moving on a 5x5 table

The toy robot can be placed on a 5x5 table and moved around according to commands you input.

## Installation
Clone this repository and run: `ruby toy_robot_programme.rb`

## Available commands:
- **PLACE**   Moves the robot (example: **PLACE 0,2,NORTH**)
- **MOVE**	Moves the robot one unit forward in the direction it's facing
- **LEFT**	Rotates the robot 90 degrees counter-clockwise
- **RIGHT**	Rotates the robot 90 degrees clockwise
- **REPORT**	Shows the position of the robot

## Rules
- The first command must be a valid **PLACE** command
- The table is a 5x5 grid with **(0,0)** at the south-west corner
- Any command that would make the robot fall off the table is ignored
- The robot must be placed before it can accept other commands