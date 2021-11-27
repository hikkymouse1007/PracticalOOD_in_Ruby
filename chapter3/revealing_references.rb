class RevealingReferences
  attr_reader :wheels
  def initialize(data)
    @wheels = wheelify(data)
  end

  ## 責任を分離しないコード
  # def diameters
  #   wheels.collect{|wheel|
  #     wheel.rim + (wheel.tire * 2)}
  # end
  
  ## 責任を分離したコード
  def diameters
    wheels.collect{|wheel| diameter(wheel)}
  end
  ## 責任を分離したことで、車輪半径ひとつだけを取得することができる
  def diameter(wheel)
    wheel.rim + (wheel.tire * 2)
  end

  Wheel = Struct.new(:rim, :tire)
  def wheelify(data)
    data.collect {|cell|
      wheel.new(cell[0], cell[1])}
  end
end