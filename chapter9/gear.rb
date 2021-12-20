class Gear
  ## アクセサとは: https://qiita.com/yoshimitsu41/items/5f174ff74d8e8b15b0be
  attr_reader :chainring, :cog, :wheel
  def initialize(args)
    @chainring = args[:chainring]
    @cog       = args[:cog]
    @wheel     = args[:wheel]
  end

  def gear_inches
    ratio * wheel.diameter
  end

  def ratio
    chainring / cog.to_f ## convert to float
  end
end
