class Trip
  attr_reader :bicycles, :customers, :vehicle

  def prepare(preparers)
    preparers.each{|preparer|
      preparer.prepare_trip(self)
    }
  end
end