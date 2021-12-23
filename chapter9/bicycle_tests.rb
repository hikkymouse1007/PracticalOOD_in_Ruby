require 'minitest/autorun'
require './bicycle.rb'
require './road_bike.rb'
require './bicycle_interface_test.rb'

class BicycleTest < MiniTest::Unit::TestCase
  include BicycleInterfaceTest
  def setup
    @bike = @object = Bicycle.new({tire_size: 0})
  end
end

class RoadBikeTest < MiniTest::Unit::TestCase
  include BicycleInterfaceTest
  def setup
    @bike = @object = RoadBike.new
  end
end