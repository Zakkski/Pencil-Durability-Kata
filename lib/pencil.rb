class Pencil
  attr_reader :durability

  def initialize(attributes = {})
    @durability = attributes[:durability] || 10

  end

  def write(text, input)
    letters = input.split('').map { |letter| write_letter(letter) }.join('')
    text + letters
  end

  def write_letter(letter)
    return " " if @durability.zero?

    @durability -= 1
    return letter
    # if letter =~ /\s/
  end

end
