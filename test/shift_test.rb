require_relative 'test_helper'
require 'date'
require './lib/shift'

class ShiftTest < Minitest::Test

  def setup
    @shift = Shift.new
  end

  def test_it_exists
    assert_instance_of Shift, @shift
  end

  def test_it_has_attributes
    assert_equal Array, @shift.key.class
    assert_equal 5, @shift.key.length
    assert_equal String, @shift.date.class
    assert_equal 6, @shift.date.length
  end

  def test_keys_are_random
    shift1 = Shift.new
    shift2 = Shift.new
    shift3 = Shift.new

    assert_equal false, shift1 == shift2
    assert_equal false, shift1 == shift3
    assert_equal false, shift2 == shift3
  end

  def test_keys_can_be_grouped
    @shift.stubs(:key => "01234")
    expected = ["01", "12", "23", "34"]
    assert_equal expected, @shift.key_grouping
  end
end
