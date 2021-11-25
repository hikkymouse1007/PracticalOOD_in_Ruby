require "./gear.rb"

puts Gear.new(52, 11).cog
puts Gear.new(30, 27).ratio

## 初期化パラメータ不足
# Traceback (most recent call last):
#         2: from executable.rb:3:in `<main>'
#         1: from executable.rb:3:in `new'
# /Users/mashimohroki/Desktop/Programming/Ruby /PracticalOOD_in_Ruby/chapter2/gear.rb:3:in `initialize': wrong number of arguments (given 4, expected 2) (ArgumentError)