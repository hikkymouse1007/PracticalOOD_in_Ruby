# require './bicycle.rb' は不要
class RoadBike < Bicycle
  attr_reader :size, :chain, :tire_size

  def initialize(args)
    @tape_color = args[:tape_color]

    # superクラスのinitializeを呼び出す
    super(args)
  end

  def default_tire_size
    '23'
  end
end