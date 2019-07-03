require_relative '../lib/pencil.rb'

describe 'Pencil' do
  it 'should have a class of "Pencil"' do
    Object.const_defined?('Pencil')
  end

  describe '#durability' do
    it 'should return durability of the pencil' do
      expect(Pencil.new).to respond_to :durability
    end
  end

  describe '#write' do
    pencil = Pencil.new()

    it 'should be able to write text to a paper' do
      expect(pencil.write("", "World")).to eq("World")
    end

    # it 'should assume every input is that start of a new word (add a space before it begins)' do
    #   expect(pencil.write("Hello", "World")).to eq("Hello World")
    # end

    pencil5 = Pencil.new(durability: 5)

    it 'should only be able to write characters if durability is greater than 0' do
      expect(pencil5.write("", "worlds")).to eq("world ")
    end
  end
end
