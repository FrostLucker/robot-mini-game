require_relative "../controllers/controller.rb"
require_relative "../exceptions/fall_exception.rb"

# = Get here commands from console and translate it to controller
class Game
  # Because of handling exceptions there need some command to leave app
  EXIT_COMMANDS = ['finish', 'exit', 'quit']
  attr_accessor :controller, :input, :output

  def exit?(command)
    EXIT_COMMANDS.include? command.downcase
  end

  def split_command(command)
    return if command.empty?
    variables = nil
    splitted_command = command.split(" ")
    action = splitted_command.first
    splitted_command.slice!(0)  

    variables = splitted_command.join(" ").split(',') if splitted_command.length >= 1
    return [action,variables]
  end


  # if command from terminal has in controller it will be executed
  #   otherwise throw exception with explanation

  def send_action(command)
    action, variables = split_command(command)
    begin
      @controller.send(action.downcase, *variables)
      wait_for_command
    rescue NoMethodError => e
      @output.puts "There no action: '#{action}' in this game. Use: 'place(x,y,f), move, left, right'"
      wait_for_command if !exit?(command)
    end
  end

  # it possible to change source 
  # of output or input

  def initialize
    @input  = $stdin
    @output = $stdout    
  end

  def wait_for_command
    begin
      command = @input.gets.chop
      # without initialized controller we can't move robot
      unless @controller.nil?
        send_action(command) if !exit?(command)
      else
        initialize_controller(command)
      end
    rescue FallException, Exception => error 
      @output.puts error.message
      wait_for_command 
    end
  end

  def initialize_controller(command)
    action, variables = split_command(command)
    return if exit?(command)
    if action && action.downcase != 'place'
      @output.puts "Sorry, you should place your robot first!"

      command = self.input.gets.chop
      initialize_controller(command)
    else
      @controller = Controller.new(5, 5 ,*variables) unless command.empty?
      wait_for_command
    end
  end

  def start
    @output.puts "Place you robot on field(5x5), you can exit by typing exit or finish commands"
    begin
      command = self.input.gets.chop
      initialize_controller(command)
    rescue FallException, Exception => error 
      @output.puts error.message
      wait_for_command
    end
  end
end

