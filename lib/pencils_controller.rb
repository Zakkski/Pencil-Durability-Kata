require_relative 'pencil_view.rb'

class PencilsController
  attr_reader :text

  def initialize(pencil, text)
    @pencil = pencil
    @text = text
    @view = PencilView.new
  end

  def write
    message = "What would you like to write?"
    input = @view.get_input(message)
    @text = @pencil.write(@text, input)
  end

  def erase
    message = "What would you like to erase?"
    input = @view.get_input(message)
    @text = @pencil.erase(@text, input)
  end

  def edit
    message = "Which blank spot would you like to edit?"
    @view.display_options(@pencil.edit_spots)
    id = @view.get_input(message).to_i - 1
    message2 = "What would you like to write there?"
    input = @view.get_input(message2)

    @text = @pencil.edit(@text, input, id)
  end

  def sharpen
    @pencil.sharpen
    puts "Your pencil has been sharpened!"
    gets.chomp
  end
end
