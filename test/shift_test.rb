require_relative 'test_helper'
require 'date'
require './lib/shift'

class ShiftTest < Minitest::Test

  def setup
    @shift = Shift.new("02715", "040895")
  end

  def test_it_exists
    assert_instance_of Shift, @shift
  end

end
