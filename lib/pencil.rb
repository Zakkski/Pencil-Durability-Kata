class Pencil
  attr_reader :durability

  def initialize(attributes = {})
    @durability = attributes[:durability] || 10

  end

  def write(text, input)
    letters = input.split('').map { |char| write_char(char) }.join('')
    text + letters
  end

  def write_char(char)
    return " " if @durability.zero?
    @durability -= 1 unless char.match?(/\s/)
    char
  end

end
