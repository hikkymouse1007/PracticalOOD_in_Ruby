require './bicycle.rb'
require './parts.rb'
require './road_bike_parts.rb'
require './mountain_bike_parts.rb'

p bicycle = Bicycle.new(
  size:       'L',
  parts: Parts.new
)

p road_bike = Bicycle.new(
  size:       'L',
  parts: RoadBikeParts.new(tape_color: 'red')
)

p road_bike.size
p road_bike.spares

p mountain_bike = Bicycle.new(
  size:        'L',
  parts: MountainBikeParts.new(rear_shock:  'Fox')
)

p mountain_bike.size
p mountain_bike.spares