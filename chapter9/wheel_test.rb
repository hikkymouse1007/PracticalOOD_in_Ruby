require 'minitest/autorun'
require './wheel.rb'
require './diameterizable_interface_test.rb'
class WheelTest < MiniTest::Unit::TestCase
  include DiameterrizableInterfaceTest
  def setup
    @wheel = @object = Wheel.new(26, 1.5)
  end

  def test_calculates_diameter
    wheel = Wheel.new(26, 1.5)

    assert_in_delta(
      29,
      wheel.diameter,
      0.01
    )
  end
end