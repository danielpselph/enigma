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

  def test_can_encrypt_message_with_key_and_date_and_special_char
    expected = {encryption: "keder, ohulw", key: "02715", date: "040895"}
    assert_equal expected, @enigma.encrypt("hello, world", "02715", "040895")
  end

  def test_can_encrypt_massage_with_key_and_current_date
    expected = {encryption: "nib udmcxpu", key: "02715", date: "150120"}
    assert_equal expected, @enigma.encrypt("hello world", "02715")
  end

  def test_can_encrypt_message_with_random_key_and_date
    @enigma.stubs(:key => "56789")
    @enigma.stubs(:date=> "140120")
    expected = {encryption: "nvituqtwxba", key: "56789", date: "140120"}
    assert_equal expected, @enigma.encrypt("hello world", "56789", "140120")
  end

  def test_can_decrypt_message_with_key_and_date
    expected = {decryption: "hello world", key: "02715", date: "040895"}
    assert_equal expected, @enigma.decrypt("keder ohulw", "02715", "040895")
  end

  def test_can_decrypt_message_with_key_and_date_and_special_char
    expected = {decryption: "hello, world", key: "02715", date: "040895"}
    assert_equal expected, @enigma.decrypt("keder, ohulw", "02715", "040895")
  end

  def test_can_decrypt_message_with_key_and_current_date
    @enigma.encrypt("hello world", "56789", "140120")
    expected = {encryption: "nvituqtwxba", key: "56789", date: "140120"}
    assert_equal expected, @enigma.encrypt("hello world", "56789", "140120")
    @enigma.decrypt("nvituqtwxba", "56789", "140120")
    expected = {decryption: "hello world", key: "56789", date: "140120"}
    assert_equal expected, @enigma.decrypt("nvituqtwxba", "56789", "140120")
  end
end
