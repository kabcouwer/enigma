class Enigma
  attr_reader :character_set

  def initialize
    @character_set = ("a".."z").to_a << " "
  end

  def calculate_shift(key, date)
    enigma_key = Key.new(key)
    key_array = enigma_key.create_A_B_C_D_keys
    enigma_offset = Offset.new(date)
    offset_array = enigma_offset.create_A_B_C_D_offset
    shift_array = []
    shift_array << key_array << offset_array
    shift_array.transpose.map do |arr|
      arr.reduce(0) do |sum, num|
        sum + num
      end
    end
  end

  def encrypt(message, key, date)
    calculate_shift(key, date)

  end

end
