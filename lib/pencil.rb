class Pencil
  attr_reader :durability

  def initialize(attributes = {})
    @durability = attributes[:durability] || 10

  end

  def write(text, input)
    letters = input.split('').map { |char| write_char(char) }.join('')
    text + letters
  end


  private

  def write_char(char)
    return " " if @durability.zero?

    unless char.match?(/\s/)
      capital_letter?(char) ? @durability -= 2 : @durability -= 1
    end
    char
  end

  def capital_letter?(char)
    char == char.upcase
  end

end
