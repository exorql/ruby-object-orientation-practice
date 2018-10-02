class Gear
  attr_reader :chainring, :cog, :wheel
  def initialize(chainring, cog, wheel)
    @chainrign = chainring
    @cog = cog
    @wheel = wheel
  end

  def gear_inches
    ratio * wheel.diameter
  end
end

# Gearはdiameterを知るDuckを要求する
Gear.new(52, 11, Wheel.new(26, 1.5)).gear_inches
