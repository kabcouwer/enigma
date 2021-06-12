require_relative 'spec_helper'

RSpec.describe Offset do
  describe 'instantiation' do
    it 'exists' do
      offset = Offset.new('today')

      expect(offset).to be_a(Offset)
    end

    it 'has readable attributes' do
      offset = Offset.new('today')

      expect(offset.date_as_number).to eq(110621)

      offset = Offset.new('013089')

      expect(offset.date_as_number).to eq(13089)
    end
  end

  describe 'methods' do
    it 'can create A-D offsets' do
      offset = Offset.new('013089')

      expect(offset.create_A_B_C_D_offset).to be_an(Array)
      expect(offset.create_A_B_C_D_offset).to eq([1, 9, 2, 1])

      offset = Offset.new('today')

      expect(offset.create_A_B_C_D_offset).to be_an(Array)
      expect(offset.create_A_B_C_D_offset).to eq([5, 6, 4, 1])
    end
  end
end
