class Gear
  ## アクセサとは: https://qiita.com/yoshimitsu41/items/5f174ff74d8e8b15b0be
  attr_reader :chainring, :cog, :rim, :tire
  def initialize(chainring, cog, rim ,tire)
    @chainring = chainring
    @cog       = cog
    @rim       = rim
    @tire      = tire
  end

  def ratio
    chainring / cog.to_f ## convert to float
  end

  def gear_inches
    ## bad: Wheelクラスの存在を予想
    ## bad: Wheelがdiameterに応答することを予想
    ## bad: GearはWheelに必要な引数を知っている
    ## bad: Wheelの引数の順番を知っている
    ratio * Wheel.new(rim, tire).diameter
  end
end

class Wheel
  attr_reader :rim, :tire

  def initialize(rim, tire)
    @rim  = rim
    @tire = tire
  end

  def diameter
    rim + (tire * 2)
  end

  def circumference
    diameter * Math::PI
  end
end

pp Gear.new(52, 11, 26, 1.5).gear_inches
