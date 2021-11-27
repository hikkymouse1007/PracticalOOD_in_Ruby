require "./gear.rb"
require "./wheel.rb"

@wheel = Wheel.new(26, 1.5)
puts @wheel.circumference
puts Gear.new(52, 11, @wheel).gear_inches
puts Gear.new(52, 11).ratio # wheelはnil
puts Gear.new(52, 11, @wheel).ratio # 実行可能

## `gear_inches': undefined method `diameter' for nil:NilClass (NoMethodError)
# puts Gear.new(52, 11).gear_inches # 実行不可能, wheel=nilによってwheelに依存したメゾッドの実行はできない

