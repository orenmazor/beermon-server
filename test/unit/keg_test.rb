require 'test_helper'

class KegTest < ActiveSupport::TestCase

  setup do
    @keg = kegs(:keg_o_darkhorse)
  end

  test "it should be able to report the remaining liquid in a keg" do
    keg = kegs(:keg_o_darkhorse)

    assert_equal 1, keg.measurements.count
    assert_equal 49.0, keg.remaining

    keg.measurements.create(:volume => 0.5)
    assert_equal 48.5, keg.remaining
  end

  test "if a keg has more than the threshold" do
    assert !@keg.below_threshold?
  end

  test "if a keg has less than the threshold" do
    @keg.measurements.create(:volume => @keg.capacity - 4.0)
    assert @keg.reload.below_threshold?
  end
end
