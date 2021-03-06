require "./wheel.rb"

class Gear
  ## アクセサとは: https://qiita.com/yoshimitsu41/items/5f174ff74d8e8b15b0be
  attr_reader :chainring, :cog, :wheel
  def initialize(chainring, cog, wheel=nil)
    @chainring = chainring
    @cog       = cog
    @wheel     = wheel
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
