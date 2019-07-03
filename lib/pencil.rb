class Pencil
  attr_reader :durability, :length, :eraser

  def initialize(attributes = {})
    @durability = attributes[:durability] || 10
    @max_durability = @durability
    @length = attributes[:length] || 2
    @eraser = attributes[:eraser] || 10
  end

  def write(text, input)
    letters = input.split('').map { |char| write_char(char) }.join('')
    text + letters
  end

  def sharpen
    return if @length.zero?
    @length -= 1
    @durability = @max_durability
  end

  def erase(text, input)
    words = text.split(/\b/).reverse
    word_id = words.find_index { |word| word == input }
    erased_word = words[word_id].split('')
                                .reverse
                                .map { |char| erase_char(char) }
                                .reverse
                                .join('')
    words[word_id] = erased_word
    words.reverse.join('')
  end

  private

  def write_char(char)
    return " " if @durability.zero?

    unless char.match?(/\s/)
      capital_letter?(char) ? @durability -= 2 : @durability -= 1
    end
    char
  end

  def erase_char(char)
    unless @eraser.zero?
      @eraser -= 1
      return ' '
    end
    char
  end

  def capital_letter?(char)
    char == char.upcase
  end
end
