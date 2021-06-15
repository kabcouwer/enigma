require './spec/spec_helper'

enigma = Enigma.new

handle = File.open(ARGV[0], 'r')
message = handle.read
handle.close

decryption = enigma.decrypt(message, ARGV[2], ARGV[3])
writer = File.open(ARGV[1], 'w')
writer.write(decryption[:decryption])
writer.close

puts "Created 'decrypted.txt' with the key #{enigma.key} and date #{enigma.date}"
