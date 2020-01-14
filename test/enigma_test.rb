require_relative 'test_helper'
require 'date'
require './lib/enigma'
require './lib/shift'

class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end


  def test_can_encrypt_message_with_key_and_date
    expected = {encryption: "keder ohulw", key: "02715", date: "040895"}
    assert_equal expected, @enigma.encrypt("hello world", "02715", "040895")
  end

  def test_can_encrypt_massage_with_key_and_current_date
    expected = {encryption: "nib udmcxpu", key: "02715", date: "140120"}
    assert_equal expected, @enigma.encrypt("hello world", "02715")
  end

  def test_can_encrypt_message_with_random_key_and_date
    @enigma.stubs(:key => "56789")
    @enigma.stubs(:date=> "140120")
    expected = {encryption: "nvituqtwxba", key: "56789", date: "140120"}
    assert_equal expected, @enigma.encrypt("hello world", "56789", "140120")
  end

  def test_can_decrypt_message_with_key_and_date
    # skip
    expected = {decryption: "hello world", key: "02715", date: "040895"}
    assert_equal expected, @enigma.decrypt("keder ohulw", "02715", "040895")
  end
end




# #decrypt a message with a key (uses today's date)
# pry(main) > enigma.decrypt(encrypted[:encryption], "02715")
# #=> # decryption hash here
#
