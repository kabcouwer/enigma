class Key
  attr_reader :enigma_key

  def initialize(key)
    @enigma_key = nil
    generate_key(key)
  end

  def generate_key(key)
    if key == 'random'
      @enigma_key = 5.times.map do |num|
        num = rand(10)
      end.join
    else
      @enigma_key = key
    end
  end

  def create_A_B_C_D_keys
    Array.new(4) do |i|
      [@enigma_key[i], @enigma_key[i + 1]].join.to_i
    end
  end
end
