require_relative '../lib/pencil.rb'

describe 'Pencil' do
  pencil = Pencil.new
  text = ""

  it 'should have a class of "Pencil"' do
    Object.const_defined?('Pencil')
  end

  describe '#write' do
    it 'should be able to write text to a paper' do
      expect(pencil.write("", "World")).to eq("World")
    end

    it 'should assume every input is that start of a new word (add a space before it begins)' do
      expect(pencil.write("Hello", "World")).to eq("Hello World")
    end
  end
end
