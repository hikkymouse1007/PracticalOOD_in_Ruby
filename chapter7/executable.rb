require './bicycle.rb'
require './vehicle.rb'
require './mechanic.rb'
require 'date'

starting = Date.parse("2015/09/04")
ending = Date.parse("2015/09/10")

p b = Bicycle.new
p b.schedulable?(starting, ending)

p v = Vehicle.new
p v.schedulable?(starting, ending)

p m = Mechanic.new
p m.schedulable?(starting, ending)