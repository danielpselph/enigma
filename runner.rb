require './lib/enigma'
require './lib/shift'
# require './test/test_helper'

enigma = Enigma.new

message = File.open(ARGV[0], "r")

incoming_text = message.read


encrypted_message = enigma.encrypt(incoming_text)
# require "pry"; binding.pry
file = File.write(ARGV[1], encrypted_message)

# require 'pry'; binding.pry
puts "Created 'encrypted.txt' with the key #{encrypted_message[:key]} and date #{encrypted_message[:date]}"
