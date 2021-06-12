require_relative 'spec_helper'

RSpec.describe Key do
  describe 'instantiation' do
    it 'exists' do
      key = Key.new('02715')

      expect(key).to be_a(Key)
    end

    it 'has readable attributes' do
      key = Key.new('02715')

      expect(key.enigma_key).to eq('02715')
    end
  end

  describe 'methods' do
    it 'can generate a random enigma_key' do
      # mock_key = double("Random Key")
      # allow(mock_key).to receive(:enigma_key).and_return('random')
      #
      # expect(mock_key.enigma_key).to eq('random')
      key = Key.new('random')

      expect(key.enigma_key).to be_a(String)
      expect(key.enigma_key.length).to eq(5)
    end

    it "can create A key, B key, C key, and D key" do
      key = Key.new('02715')

      expect(key.create_A_B_C_D_keys).to be_an(Array)
      expect(key.create_A_B_C_D_keys).to eq([02, 27, 71, 15])

      key = Key.new('random')

      expect(key.create_A_B_C_D_keys).to be_an(Array)
      expect(key.create_A_B_C_D_keys.length).to eq(4)
    end
  end
end
