require './spec/spec_helper'

enigma = Enigma.new

handle = File.open(ARGV[0], 'r')
message = handle.read
handle.close

encryption = enigma.encrypt(message, "82648", "240818")
writer = File.open(ARGV[1], 'w')
writer.write(encryption[:encryption])
writer.close

puts "Created 'encrypted.txt' with the key #{enigma.key} and date #{enigma.date}"
