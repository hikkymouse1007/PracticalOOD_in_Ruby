# require './bicycle.rb'

# p bike = Bicycle.new(
#   size: 'M',
#   tape_color: 'red' )
# p bike.size
# p bike.spares[:tire_size]

require './bicycle2.rb'

p bike = Bicycle.new(
  style: :mountain,
  size: 'S',
  front_shock: 'Manitou',
  rear_shock: 'Fox' )
p  bike.spares