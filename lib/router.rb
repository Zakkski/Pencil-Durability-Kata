class Router
  def initialize(pencil_controller)
    @pencil_controller = pencil_controller
    @running = true
  end

  def run
    while @running
      list_options
      input = gets.chomp.to_i
      route_action(input)
    end
  end

  private

  def list_options
    system 'clear'
    puts @pencil_controller.text
    puts "------------------------------"
    puts "What would you like to do?"
    puts "1. Write"
    puts "2. Erase"
    puts "3. Edit"
    puts "4. Sharpen"
    puts "5. Exit"
    print ">>"
  end

  private

  def exit
    @running = false
  end

  def try_again
    puts "Improper input, try again."
    gets.chomp
  end

  def route_action(input)
    case input
    when 1
      @pencil_controller.write
    when 2
      @pencil_controller.erase
    when 3
      @pencil_controller.edit
    when 4
      @pencil_controller.sharpen
    when 5
      exit
    else
      try_again
    end
  end
end
