class Key
  attr_reader :enigma_key

  def initialize(key)
    @enigma_key = nil
    generate_key(key)
  end

  def generate_key(key)
    if key == 'random'
      @enigma_key = 5.times.map do |n|
        n = rand(0..9)
      end.join
    else
      @enigma_key = key
    end
  end
end
