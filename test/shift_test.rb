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

  def test_grouped_keys_can_be_returned_as_integers
    @shift.stubs(:key => "01234")
    expected = [1, 12, 23, 34]
    assert_equal expected, @shift.key_grouping_int
  end

  def test_current_date_returned_as_default
    shift1 = Shift.new
    shift2 = Shift.new
    shift3 = Shift.new

    assert_equal true, shift1.date == shift2.date
    assert_equal true, shift1.date == shift3.date
    assert_equal true, shift2.date == shift3.date
  end

  def test_can_return_squared_date
    @shift.stubs(:date => "010203")
    assert_equal "104101209", @shift.squared_date
  end

  def test_can_return_offset_date_value
    @shift.stubs(:date => "190287")
    assert_equal "36209142369", @shift.squared_date
    assert_equal ["2", "3", "6", "9"], @shift.offset_date
  end

  def test_can_return_offset_date_value_as_integers
    @shift.stubs(:date => "190287")
    expected = [2, 3, 6, 9]
    assert_equal expected, @shift.offset_date_int
  end

  def test_can_create_key_and_offset_date_hash
    @shift.stubs(:key => "35468")
    @shift.stubs(:date => "101112")
    # @shift.offset_date_int
    # @shift.key_grouping_int
    expected = {A: 41, B: 59, C: 50, D: 72}
    assert_equal expected, @shift.shift_key
  end
end
