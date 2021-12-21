require 'minitest/autorun'
require './prepare_interface_test.rb'
require './driver.rb'
require './mechanic.rb'
require './trip.rb'
require './trip_coordinator.rb'

class MechanicTest < MiniTest::Unit::TestCase
  include PrepareInterfaceTest

  def setup
    @mechanic = @object = Mechanic.new
  end
end

class TripCoordinatorTest < MiniTest::Unit::TestCase
  include PrepareInterfaceTest

  def setup
    @trip_coordinator = @object = TripCoordinator.new
  end
end

class DriverTest < MiniTest::Unit::TestCase
  include PrepareInterfaceTest

  def setup
    @driver = @object = Driver.new
  end
end

class TripTest < MiniTest::Unit::TestCase
  def test_requests_trip_preparation
    @preparer = MiniTest::Mock.new
    @trip = Trip.new
    # https://docs.ruby-lang.org/ja/2.1.0/method/MiniTest=3a=3aMock/i/expect.html
    # expect(name, retval, args = []) -> self
    # [PARAM] name:
    # メソッド名を指定します。
    # [PARAM] retval:
    # 返り値として期待する値を指定します。
    # [PARAM] args:
    # 引数として期待する値を配列で指定します。
    @preparer.expect(:prepare_trip, nil, [@trip])

    p @trip.prepare([@preparer])
    p @preparer.verify
  end
end

