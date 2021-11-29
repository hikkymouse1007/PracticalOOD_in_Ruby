require "./wheel.rb"

module SomeFramework
  class Gear
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
end

## ラッパーを定義することで、Gearの初期化のパラメータ引数をハッシュから渡すことができる
module GearWrapper
  def self.gear(args)
    SomeFramework::Gear.new(args[:chainring],
                            args[:cog],
                            args[:wheel])
  end
end

# Gearクラスにハッシュで引数を渡せるので、引数の順番に依存しない
puts GearWrapper.gear(
  :chainring => 52,
  :cog => 11,
  :wheel => Wheel.new(26, 1.5)
).gear_inches

# 同じくGearクラスにハッシュで引数を渡せるので、引数の順番に依存しない
puts GearWrapper.gear(
  :cog => 15,
  :wheel => Wheel.new(26, 1.5),
  :chainring => 521
).gear_inches
