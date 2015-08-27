require_relative "../models/robot.rb"
require_relative "../exceptions/fall_exception.rb"

# = This class holds the robot and all actions that
# = you can do with it
# 
# All basic commands are place here
# One controller can  use only one toy
#
# ==== Examples
#
# controller = Controller.new(5, 5 ,0 , 0, "South")
# controller.report

class Controller
  attr_accessor :toy, :field_x, :field_y

  FACED_VALUES = ['West', 'North', 'East', 'South']

  def initialize(field_x, field_y, x, y, f)
    raise FallException.new("You can't place robot out of field!") if field_x < x.to_i || field_y < y.to_i

    @field_x = field_x
    @field_y = field_y

    if robot_faced_correct?(f)
      @toy = Robot.new(x, y, f)
    else
      raise FallException.new("You can face your robot only in #{FACED_VALUES.join(', ')}")
    end
  end

  def move
    case @toy.f
      when 'North'
        @toy.y += 1 unless @toy.y >= @field_y - 1
      when 'South'
        @toy.y -= 1 unless @toy.y <= 0
      when 'West'
        @toy.x -= 1 unless @toy.x <= 0
      when 'East'
        @toy.x += 1 unless @toy.x >= @field_x -1
    end
  end

  def report
    str = "#{@toy.x}, #{@toy.y}, #{@toy.f}"
    puts str
    str
  end

  def place(x, y, f)
    raise FallException.new("You can't place robot out of field!") if @field_x < x.to_i || @field_y < y.to_i
    @toy.x = x.to_i
    @toy.y = y.to_i

    if robot_faced_correct?(f)
      @toy.f = f.downcase.capitalize
    else
      raise FallException.new("You can face your robot only in #{FACED_VALUES.join(', ')}")
    end
  end

  def robot_faced_correct?(f)
    f.strip!
    correct = f.is_a?(String) && FACED_VALUES.include?(f.downcase.capitalize)

    correct
  end

  # FACED_VALUES are structured so, that changes to index by one is
  # equal to turn toy left or right


  # Turn robot to the left
  def left
    index = FACED_VALUES.index(@toy.f) - 1
    @toy.f = FACED_VALUES[index]
  end

  # Turn robot to the right
  def right
    index = FACED_VALUES.index(@toy.f) + 1

    index = 0 if index == FACED_VALUES.length
    @toy.f = FACED_VALUES[index]
  end

end

Controller.new(1, 2, 1, 1, 3).left
