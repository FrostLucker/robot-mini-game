Toy Robot Simulator

 * The application is a simulation of a toy robot moving on a square tabletop, of dimensions 5
units x 5 units.
 * There are no other obstructions on the table surface.
 * The robot is free to roam around the surface of the table, but must be prevented from falling to destruction. Any movement that would result in the robot falling
	 from the table must be prevented, however further valid movement commands must still be allowed.

Thi s is super simple implementation of toy-robot simulator which can be controlled by the following commands:

This robot was designed and implemented with KISS (Keep It Stupid Simple) and YAGNI (You Aren't Gonna Need It) principles. ;)

To setup all depended gems please launch bundle install

ruby version 2.1.2
To launch the game please execute the following command: ruby main.rb


Basic behavior of this app are: 
 I have three layers of app
 1) Models (Toys and children)
 2) Controller that rule toy in our case it is robot
 3) Game , control console inputs and send command to controller

 