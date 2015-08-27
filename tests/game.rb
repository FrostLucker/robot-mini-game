require_relative "../game/game.rb"
require "test/unit"
require 'stringio'

class TestGame < Test::Unit::TestCase

  def capture_name
    $stdin.gets.chomp
  end

  def test_split_command
    game = Game.new
    command = "Place 1,2,South"
    action, variables = game.split_command(command)

    assert_equal("Place", action)
    assert_equal(["1", "2", 'South'], variables)


    command = ""
    action, variables = game.split_command(command)

    assert_equal(nil, action)
    assert_equal(nil, variables)
  end

  def test_game_start
    game = Game.new
    command = "Place 1,2,South\nreport\n"
    action, variables = game.split_command(command)

    @input = StringIO.new("#{command}exit\n")
    $stdout = StringIO.new

    game.input = @input

    game.start
    assert_equal($stdout.string, "1, 2, South\n")
  end
end

