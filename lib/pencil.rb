class Pencil
  attr_reader :durability, :length

  def initialize(attributes = {})
    @durability = attributes[:durability] || 10
    @max_durability = @durability
    @length = attributes[:length] || 2
  end

  def write(text, input)
    letters = input.split('').map { |char| write_char(char) }.join('')
    text + letters
  end

  def sharpen
    unless @length == 0
      @length -= 1
      @durability = @max_durability
    end
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
