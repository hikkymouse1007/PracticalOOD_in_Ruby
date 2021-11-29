require "./wheel.rb"

class Gear
  attr_reader :chainring, :cog, :wheel
  def initialize(args)
    @chainring = args[:chainring]
    @cog       = args[:cog]
    @wheel     = args[:wheel]
  end

  def ratio
    chainring / cog.to_f ## convert to float
  end

  def gear_inches
    ## カプセル化したメゾッドの呼び出し
    ratio * diameter
  end

  ## メゾッド内にカプセル化
  def diameter
    wheel.diameter
  end

  def wheel
    ## keyword: 自己代入 (||=)
    @wheel ||= Wheel.new(rim, tire)
  end
end

puts Gear.new(
  :chainring => 52,
  :cog => 11,
  :wheel => Wheel.new(26, 1.5)
).gear_inches