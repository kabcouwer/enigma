require_relative 'spec_helper'

RSpec.describe Enigma do
  before :each do
    @enigma = Enigma.new
  end
  describe 'instantiation' do
    it 'exists' do
      expect(@enigma).to be_an(Enigma)
    end
  end

  describe 'methods' do
    xit 'can encrypt a message with a key and date' do
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
