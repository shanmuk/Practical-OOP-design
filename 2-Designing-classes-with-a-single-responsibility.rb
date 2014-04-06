class Gear
  attr_reader :chainring, :cog, :wheel

  def initialize(args)
    @chainring = args[:chainring]
    @cog       = args[:cog]
    @wheel     = args[:wheel]
  end
  
  def ratio
    chainring * cog.to_f
  end

  def gear_inches
    ratio * wheel.diameter
  end
end

class Wheel
  attr_reader :rim, :tire

  def initialize(args)
    @rim  = args[:rim]  
    @tire = args[:tire]  
  end
  
  def diameter
    rim + (tire * 2)
  end
  
  def circumference
    diameter * Math::PI
  end
end

@wheel = Wheel.new rim: 26, tire: 1.5
puts @wheel.diameter

puts Gear.new(chainring: 52, cog: 11, wheel: @wheel).gear_inches
puts Gear.new(chainring: 52, cog: 11).ratio