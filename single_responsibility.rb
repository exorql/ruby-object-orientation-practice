# このメソッドの責務を分ける
def diameters
  wheel.collect { |wheel| wheel.rim + {wheel.tire * 2) }
end

# 配列を繰り返し処理
def diameters
  wheels.collect { |wheel| diameter(wheel) }
end

# 車輪の直径を計算
def diameter(wheel)
  wheel.rim + (wheel.tire * 2)
end

class Gear
  attr_reader :chainring, :cog, :rim, :tire
  def initialize(chainring, cog, rim, tire)
    @chainrign = chainring
    @cog = cog
    @rim = rim
    @tire = tire
  end

  def ratio
    chainring / cog.to_f
  end

  def gear_inches
    ratio * Wheel.new(rim, tire).diameter
  end
end

class Wheel
  attr_reader :rim, :tire
  def initialize(rim, tire)
    @rim = rim
    @tire = tire
  end

  def diameters
    rim + (tire * 2)
  end
end    
