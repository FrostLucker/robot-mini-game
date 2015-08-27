require_relative "../models/robot.rb"
require "test/unit"
 
class TestRobot < Test::Unit::TestCase
 
  def test_creation
    robot = Robot.new(1, 2, "South")

    assert_equal(1, robot.x)
    assert_equal(2, robot.y)
    assert_equal("South", robot.f)
  end
 
end