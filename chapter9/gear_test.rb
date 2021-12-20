require 'minitest/autorun'
require './gear.rb'
require './wheel.rb'
require './diameter_double.rb'
class GearTest < MiniTest::Unit::TestCase

  def test_calculates_gear_inches
    gear = Gear.new(
      chainring: 52,
      cog:       11,
      wheel:     DiameterDouble.new
    )

    assert_in_delta(
      47.27,
      gear.gear_inches,
      0.01
    )
  end
end
