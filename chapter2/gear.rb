class Gear
  ## アクセサとは: https://qiita.com/yoshimitsu41/items/5f174ff74d8e8b15b0be
  attr_reader :chainring, :cog ## インスタンス変数の読み取りメゾッドの提供
  def initialize(chainring, cog)
    @chainring = chainring
    @cog =       cog
  end

  def ratio
    # attr_readerによってinitializeで定義された@(インスタンス変数)のアクセサが提供されるので、@が不要になる
    chainring / cog.to_f ## convert to float
  end
  
  def gear_inches
    ratio * diameter
  end
  
  def diameter
    rim + (tire * 2)
  end
end