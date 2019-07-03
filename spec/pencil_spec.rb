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
    before(:each) do
      @pencil = Pencil.new(durability: 5)
    end

    it 'should be able to write text to a paper' do
      expect(@pencil.write("", "world")).to eq("world")
    end

    # it 'should assume every input is that start of a new word (add a space before it begins)' do
    #   expect(@pencil.write("Hello", "World")).to eq("Hello World")
    # end

    it 'should only be able to write characters if durability is greater than 0' do
      expect(@pencil.write("", "worlds")).to eq("world ")
    end

    it 'should not reduce durability for spaces or newline characters' do
      @pencil.write("", "t o o")
      expect(@pencil.durability).to eq 2
    end

    it 'should lose durability faster for capital letters' do
      @pencil.write("", "TT")
      expect(@pencil.durability).to eq 1
    end
  end
end
