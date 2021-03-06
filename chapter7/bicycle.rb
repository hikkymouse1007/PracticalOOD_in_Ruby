require "./schedulable.rb"

class Bicycle
  include Schedulable
  attr_reader :size, :chain, :tire_size

  def initialize(args={})
    @size        = args[:size]
    @chain       = args[:chain]     || default_chain
    @tire_size   = args[:tire_size] || default_tire_size
    post_initialize(args)
  end

  def lead_days
    1
  end


  def spares
    { tire_size: tire_size,
      chain:     chain }.merge(local_spares)
  end

  def default_tire_size
    "1"
  end

  # subclass may overrride
  def post_initialize(args)
    nil
  end

  def local_spares
    {}
  end

  def default_chain
    '10-speed'
  end

  def lead_days
    1
  end
end