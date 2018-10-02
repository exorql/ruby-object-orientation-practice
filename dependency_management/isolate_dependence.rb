# 注意：Gearが作られるときに無条件にWheelも作られる
class Gear
  attr_reader :chainring, :cog, :rim, :tire
  def initialize(chainring, cog, rim, tire)
    @chainrign = chainring
    @cog = cog
    @wheel = Wheel.new(rim, tire)
  end

  def gear_inches
    ratio * wheel.diameter
  end
end

# wheelの作成を隔離し、独自に明示的に定義したwheelメソッド内で作られる
# 必要になるまでWheelインスタンスは作成されない
class Gear
  attr_reader :chainring, :cog, :rim, :tire
  def initialize(chainring, cog, rim, tire)
    @chainrign = chainring
    @cog = cog
    @rim = rim
    @tire = tire
  end

  def gear_inches
    ratio * wheel.diameter
  end

  # gear_inchesが実行されるまではnewされない
  def wheel
    @wheel ||= Wheel.new(rim, tire)
  end
end
