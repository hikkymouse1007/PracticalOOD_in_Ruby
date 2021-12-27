require 'minitest/autorun'
require './bicycle.rb'
require './stubbed_bike.rb'
require './road_bike.rb'
require './mountain_bike.rb'
require './bicycle_interface_test.rb'
require './bicycle_subclass_test.rb'

class BicycleTest < MiniTest::Unit::TestCase
  include BicycleInterfaceTest
  def setup
    @bike = @object = Bicycle.new({tire_size: 0})
    @stubbed_bike = StubbedBike.new
  end

  def test_force_subclass_to_implement_default_tire_size
    assert_raises(NotImplementedError) {
      @bike.default_tire_size
    }
  end

  def test_includes_local_spares_in_spares
    assert_equal @stubbed_bike.spares,
    {
      tire_size: 0,
      chain:     '10-speed',
      saddle:    'painful'
    }
  end
end

# StubbedBikeが常に動くことを保証する
class StubbedBikeTest < MiniTest::Unit::TestCase
  include BicycleInterfaceTest
  def setup
    @object = StubbedBike.new
  end
end

class RoadBikeTest < MiniTest::Unit::TestCase
  include BicycleInterfaceTest
  def setup
    @bike = @object = RoadBike.new(tape_color: 'red')
  end

  def test_puts_tape_color_in_local_spares
    assert_equal 'red', @bike.local_spares[:tape_color]
  end
end

class MountainBikeTest < MiniTest::Unit::TestCase
  include BicycleInterfaceTest
  include BicycleSubclassTest
  def setup
    @bike = @object = MountainBike.new
  end
end