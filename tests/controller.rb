require_relative "../controllers/controller.rb"
require "test/unit"
require 'spec_helper'

 
class TestController < Test::Unit::TestCase

  def test_fail_creation
    assert_raises ArgumentError do
      Controller.new()
    end

    assert_raises ArgumentError do
      Controller.new("String", "String", "String", "String", 0)
    end

    assert_raises FallException do
      Controller.new(5, 5, 6, 1, "South")
    end

    assert_raises FallException do
      Controller.new(5, 5, 3, 6, "South")
    end

    assert_raises FallException do
      Controller.new(5, 5, 3, 3, "")
    end

    assert_raises FallException do
      Controller.new(5, 5, 3, 3, 1)
    end

    assert_nothing_raised RuntimeError, ArgumentError do
      Controller.new(5, 5, 0, 0, "South")
    end

  end

  def test_move
    controler = Controller.new(5, 5, 0, 0, "South")
    controler.move

    assert_equal(0, controler.toy.y)

    controler = Controller.new(5, 5, 0, 0, "North")
    controler.move

    assert_equal(1, controler.toy.y)

    controler = Controller.new(5, 5, 0, 0, "East")
    controler.move

    assert_equal(1, controler.toy.x)

    controler = Controller.new(5, 5, 0, 0, "West")
    controler.move

    assert_equal(0, controler.toy.x)

    controler = Controller.new(5, 5, 4, 4, "West")
    controler.move

    assert_equal(3, controler.toy.x)

    controler = Controller.new(5, 5, 4, 4, "East")
    controler.move

    assert_equal(4, controler.toy.x)

    controler = Controller.new(5, 5, 4, 4, "North")
    controler.move

    assert_equal(4, controler.toy.y)

    controler = Controller.new(5, 5, 4, 4, "South")
    controler.move

    assert_equal(3, controler.toy.y)
  end

  def test_left  	
    controler = Controller.new(5, 5, 0, 0, "South")
    controler.left

    assert_equal("East", controler.toy.f)

    controler.left
    assert_equal("North", controler.toy.f)

    controler.left
    assert_equal("West", controler.toy.f)

    controler.left
    assert_equal("South", controler.toy.f)
  end

  def test_right  	
    controler = Controller.new(5, 5, 0, 0, "South")
    controler.right

    assert_equal("West", controler.toy.f)

    controler.right
    assert_equal("North", controler.toy.f)

    controler.right
    assert_equal("East", controler.toy.f)

    controler.right
    assert_equal("South", controler.toy.f)
  end

  def test_report 	
    controler = Controller.new(5, 5, 0, 0, "South")

    assert_equal("X: 0, Y: 0, Faced: South", controler.report)
    
    controler.left
    assert_equal("X: 0, Y: 0, Faced: East", controler.report)
    
    controler.move
    assert_equal("X: 1, Y: 0, Faced: East", controler.report)
  end
 
end