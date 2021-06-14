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
      shift = @enigma.calculate_shift("02715", "040895")
      expect(shift).to be_an(Array)
      expect(shift).to eq([3, 27, 73, 20])
    end

    it 'can determine which shift is occuring depending on the index' do
      shift = @enigma.calculate_shift("02715", "040895")

      expect(@enigma.find_rotation(0)).to eq(3)
      expect(@enigma.find_rotation(1)).to eq(27)
      expect(@enigma.find_rotation(2)).to eq(73)
      expect(@enigma.find_rotation(3)).to eq(20)
      expect(@enigma.find_rotation(4)).to eq(3)
      expect(@enigma.find_rotation(5)).to eq(27)
      expect(@enigma.find_rotation(6)).to eq(73)
      expect(@enigma.find_rotation(7)).to eq(20)
      expect(@enigma.find_rotation(8)).to eq(3)
      expect(@enigma.find_rotation(9)).to eq(27)
      expect(@enigma.find_rotation(10)).to eq(73)
      expect(@enigma.find_rotation(11)).to eq(20)
    end

    it 'can find the new character depending on the rotation' do
      expect(@enigma.find_new_character('h', 3)).to eq('k')
      expect(@enigma.find_new_character('e', 27)).to eq('e')
      expect(@enigma.find_new_character('l', 73)).to eq('d')
      expect(@enigma.find_new_character('l', 20)).to eq('e')
      expect(@enigma.find_new_character('o', 3)).to eq('r')
      expect(@enigma.find_new_character(' ', 27)).to eq(' ')
      expect(@enigma.find_new_character('w', 73)).to eq('o')
      expect(@enigma.find_new_character('o', 20)).to eq('h')
      expect(@enigma.find_new_character('r', 3)).to eq('u')
      expect(@enigma.find_new_character('l', 27)).to eq('l')
      expect(@enigma.find_new_character('d', 73)).to eq('w')
    end

    it 'can encrypt a message with a key and date' do
      expect(@enigma.encrypt("hello world!", "02715", "040895")).to eq({
        encryption: "keder ohulw!",
        key: "02715",
        date: "040895"
      })
    end

    it 'can dencrypt a message with a key and date' do
      expect(@enigma.decrypt("keder ohulw!", "02715", "040895")).to eq({
        encryption: "hello world!",
        key: "02715",
        date: "040895"
      })
    end

    it 'can encrypt and decrypt a message with a key (uses todays date)' do
      encrypted = @enigma.encrypt("hello world!", "02715")

      expect(encrypted[:encryption]).to be_a(String)
      expect(encrypted[:key]).to eq("02715")
      expect(encrypted[:date]).to eq("140621")

      decrypted = @enigma.decrypt(encrypted[:encryption], "02715")

      expect(decrypted[:encryption]).to eq("hello world!")
      expect(decrypted[:key]).to eq("02715")
      expect(decrypted[:date]).to eq("140621")
    end

    it 'can encrypt a message (generates random key and uses todays date)' do
      encrypted = @enigma.encrypt("hello world!")

      expect(encrypted[:encryption]).to be_a(String)
      expect(encrypted[:key]).to be_a(String)
      expect(encrypted[:date]).to be_a(String)

      decrypted = @enigma.decrypt(encrypted[:encryption], encrypted[:key], encrypted[:date])

      expect(decrypted[:encryption]).to eq("hello world!")
      expect(decrypted[:key]).to eq(encrypted[:key])
      expect(decrypted[:date]).to eq(encrypted[:date])
    end
  end
end
