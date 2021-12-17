require './bicycle.rb'
require './parts.rb'
require './part.rb'
require './road_bike_parts.rb'
require './mountain_bike_parts.rb'

p chain = Part.new(name: 'chain', description: '10-speed')

p road_tire = Part.new(name: 'tire_size', description: '23-speed')

p tape = Part.new(name: 'tape_color', description: 'red')

p mountain_tire = Part.new(name: 'tire_size', description: '2.1')

p rear_shock = Part.new(name: 'rear_shock', description: '2.1')

p front_shock = Part.new(
  name: 'front_shock',
  description: 'Manitou',
  needs_spare: false,
)

p road_bike_parts = Parts.new([chain, road_tire, tape])

p road_bike = Bicycle.new(
  size: 'L',
  parts: Parts.new([
    chain,
    road_tire,
    tape,
  ])
)

p road_bike = Bicycle.new(
  size: 'L',
  parts: road_bike_parts
)

p road_bike.size
p road_bike.spares

p mountain_bike = Bicycle.new(
  size: 'L',
  parts: Parts.new([
    chain,
    mountain_tire,
    front_shock,
    rear_shock
  ])
)

p mountain_bike.size
p mountain_bike.spares
