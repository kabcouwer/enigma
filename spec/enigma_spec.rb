require_relative 'spec_helper'

RSpec.describe Enigma do
  before :each do
    @enigma = Enigma.new
  end
  describe 'instantiation' do
    it 'exists' do
      expect(@enigma).to be_an(Enigma)
    end

    it 'has readable attributes' do
      expect(@enigma.character_set).to eq(["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "])
    end
  end

  describe 'methods' do
    it 'can calculate the shift' do
      expect(@enigma.calculate_shift("02715", "040895")).to be_an(Array)
      expect(@enigma.calculate_shift("02715", "040895")).to eq([3, 27, 73, 20])
    end

    it 'can encrypt a message with a key and date' do
      expect(@enigma.encrypt("hello world", "02715", "040895")).to eq({
        encryption: "keder ohulw",
        key: "02715",
        date: "040895"
      })
    end

    xit 'can dencrypt a message with a key and date' do
      expect(@enigma.decrypt("keder ohulw", "02715", "040895")).to eq({
        encryption: "hello world",
        key: "02715",
        date: "040895"
      })
    end
  end
end
