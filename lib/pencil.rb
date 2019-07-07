class Pencil
  attr_reader :durability, :length, :eraser, :edit_spots

  def initialize(attributes = {})
    @durability = attributes[:durability] || 10
    @max_durability = @durability
    @length = attributes[:length] || 2
    @eraser = attributes[:eraser] || 10
    @edit_spots = []
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
    @edit_spots << text.rindex(input)
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

  def edit(text, input, edit_spot)
    letters = text.split('')
    start_index = @edit_spots[edit_spot]
    (input.length).times do |id|
      new_letter = input[id]
      old_letter = letters[start_index + id]
      letters[start_index + id] = edit_letter(new_letter, old_letter)
    end
    letters.join("")
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

  def edit_letter(new_letter, old_letter)
    return old_letter if @durability.zero?

    unless new_letter.match?(/\s/)
      capital_letter?(new_letter) ? @durability -= 2 : @durability -= 1
    end

    return new_letter if old_letter == ' ' || old_letter == new_letter

    return '@'
  end

  def capital_letter?(char)
    char == char.upcase
  end
end
