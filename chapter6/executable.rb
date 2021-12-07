require './bicycle.rb'
require './road_bike.rb'
require './mountain_bike.rb'

road_bike = RoadBike.new(
  size:       'M',
  tape_color: 'red'
)

p road_bike.tire_size
p road_bike.chain

mountain_bike = MountainBike.new(
  size:        'S',
  front_shock: 'Manitou',
  rear_shock:  'Fox'
)

p mountain_bike.tire_size
p mountain_bike.chain