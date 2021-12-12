require './bicycle.rb'
require 'date'

starting = Date.parse("2015/09/04")
ending = Date.parse("2015/09/10")

p b = Bicycle.new
p b.schedulable?(starting, ending)