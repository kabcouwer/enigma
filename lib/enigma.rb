class Enigma
  attr_reader :character_set,
              :shift_array

  def initialize
    @shift_array = [],
    @character_set = ("a".."z").to_a << " "
  end

  def encrypt(message, key = 'random', date = 'today')
    encryption = []
    calculate_shift(key, date)
    message_array = message.chars
  end

  def calculate_shift(key, date)
    shift = []
    enigma_key = Key.new(key)
    key_array = enigma_key.create_A_B_C_D_keys
    enigma_offset = Offset.new(date)
    offset_array = enigma_offset.create_A_B_C_D_offset
    shift << key_array << offset_array
    @shift_array = shift.transpose.map do |arr|
      arr.reduce(0) do |sum, num|
        sum + num
      end
    end.flatten
  end

  def find_rotation(index)
    if index == 0 || index % 4 == 0
      @shift_array[0]
    elsif index == 1 || index % 4 == 1
      @shift_array[1]
    elsif index == 2 || index % 4 == 2
      @shift_array[2]
    elsif index == 3 || index % 4 == 3
      @shift_array[3]
    end
  end

  def find_new_character(element, rotation)
    original_index = @character_set.index(element)
    rotated_array = @character_set.rotate(rotation)
    rotated_array[original_index]
  end



end
