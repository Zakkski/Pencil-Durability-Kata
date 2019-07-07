class PencilView

  def get_input(message)
    puts message
    return gets.chomp
  end

  def display_options(options)
    options.each_with_index do |option, id|
      print "#{id + 1} "
    end
    print "?"
    puts ""
  end
end
