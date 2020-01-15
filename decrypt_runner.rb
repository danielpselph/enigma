require './lib/enigma'
require './lib/shift'

enigma = Enigma.new

encrypted = File.open(ARGV[0], "r")

message = encrypted.read

decrypted_message = enigma.decrypt(message, ARGV[2], ARGV[3])

file = File.write(ARGV[1], decrypted_message[:decryption])

puts "Created 'decrypted.txt' with the key #{decrypted_message[:key]} and date #{decrypted_message[:date]}"
