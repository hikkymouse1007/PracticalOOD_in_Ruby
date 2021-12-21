class Gear
  ## アクセサとは: https://qiita.com/yoshimitsu41/items/5f174ff74d8e8b15b0be
  attr_reader :chainring, :cog, :wheel, :observer
  def initialize(args)
    @chainring = args[:chainring]
    @cog       = args[:cog]
    @wheel     = args[:wheel]
    @observer  = args[:observer]
  end

  def gear_inches
    ratio * wheel.width
  end

  def ratio
    chainring / cog.to_f ## convert to float
  end

  def set_cog(new_cog)
    @cog = new_cog
    changed
  end

  def set_chainring(new_chainring)
    @chainring = new_chainring
    changed
  end

  def changed
    observer.changed(chainring, cog)
  end
end
