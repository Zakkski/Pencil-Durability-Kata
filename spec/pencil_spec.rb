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

  describe '#length' do
    it 'should return length of the pencil' do
      expect(Pencil.new).to respond_to :length
    end
  end

  describe '#eraser' do
    it 'should return eraser of the pencil' do
      expect(Pencil.new).to respond_to :eraser
    end
  end

  describe '#edit_spots' do
    it 'should return an array of editable spots' do
      expect(Pencil.new).to respond_to :edit_spots
    end
  end

  describe '#write' do
    before(:each) do
      @pencil = Pencil.new(durability: 5)
    end

    it 'should be able to write text to a paper' do
      expect(@pencil.write("", "world")).to eq("world")
    end

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

  describe '#sharpen' do
    before(:each) do
      @pencil = Pencil.new(durability: 5, length: 1)
      @pencil.write("", "empty")
      @pencil.sharpen
    end

    it 'should refill durability to starting value' do
      expect(@pencil.durability).to eq 5
    end

    it 'should reduce the length of the pencil when sharpened' do
      expect(@pencil.length).to eq 0
    end

    it 'shouldn\'t sharpen the pencil if the length is 0' do
      @pencil.write("", "empty")
      @pencil.sharpen
      expect(@pencil.durability).to eq 0
    end
  end

  describe '#erase' do
    text1 = "Whatcha gonna do when the chips are down, now      the chips are down?"
    text2 = "Whatcha gonna do when the chips are down, now that the chips are     ?"
    text3 = "Whatcha gonna do when the chips are down, now that the c     are down?"
    before(:each) do
      @pencil = Pencil.new(eraser: 4)
      @start_text = "Whatcha gonna do when the chips are down, now that the chips are down?"
    end

    it 'should erase the an input word' do
      expect(@pencil.erase(@start_text, "that")).to eq(text1)
    end


    it 'should erase last iteration of word' do
      expect(@pencil.erase(@start_text, "down")).to eq(text2)
    end

    it 'should stop erasing when eraser runs out' do
      expect(@pencil.erase(@start_text, "chips")).to eq(text3)
    end

    it 'should add the erase index to edit_spots' do
      @pencil.erase(@start_text, "Whatcha")
      @pencil.erase(@start_text, "gonna")
      expect(@pencil.edit_spots).to eq [0, 8]
    end
  end

  describe '#edit' do
    text1 = "Whatcha gonna do when the chips are down, now AAAA the chips are down?"
    text2 = "Whatcha gonna do when the chips are down, now orphe@@e chips are down?"
    text3 = "Whatcha gonna do when the chips are down, now corsethe chips are down?"

    before(:each) do
      @pencil = Pencil.new(eraser: 4)
      text = "Whatcha gonna do when the chips are down, now that the chips are down?"
      @start_text = @pencil.erase(text, "that")
    end

    it 'should replace a blank spot with the user input' do
      expect(@pencil.edit(@start_text, 'AAAA', 0)).to eq text1
    end

    it 'should replace letter collisions with @' do
      expect(@pencil.edit(@start_text, 'orpheus', 0)).to eq text2
    end

    it 'should return the old letter if the collisions are the same' do
      expect(@pencil.edit(@start_text, 'corset', 0)).to eq text3
    end

    it 'should only make edits while it has durability left' do
      low_pencil = Pencil.new(durability: 3, eraser: 4)
      text = "Whatcha gonna do when the chips are down, now that the chips are down?"
      final_text = "Whatcha gonna do when the chips are down, now Ti   the chips are down?"
      start_text = low_pencil.erase(text, "that")
      expect(low_pencil.edit(start_text, "Time", 0)).to eq final_text
    end
  end
end

# should clean inputs in router
















# end
