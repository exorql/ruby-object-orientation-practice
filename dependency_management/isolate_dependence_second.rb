# 引数に対する依存を取り除く
class Gear
  attr_reader :chainring, :cog, :wheel
  def initialize(args)
    @chainring = args[:chainring]
    @cog = args[:cog]
    @wheel = args[:wheel]
  end
end

Gear.new(
  :chainring => 52,
  :cog       => 11,
  :wheel     => Wheel.new(26, 1.5).gear_inches

# Gearが外部インターフェースの一部分
module SomeFramework
  class Gear
    attr_reader :chainring, :cog, :wheel
      def initialize(args)
      @chainring = args[:chainring]
      @cog = args[:cog]
      @wheel = args[:wheel]
    end
  end
end

# 外部のインターフェースをラップし、自身の変更から守る
module GearWrapper
  def self.gear(args)
    SomeFramework::Gear.new(args[:chainring], args[:cog], args[:wheel])
  end
end

# 引数を持つハッシュを渡すことでGearのインスタンスを作成できるようになった
GearWrapper.gear(
  :chainring => 52,
  :cog       => 11,
  :wheel     => Wheel.new(26, 1.5).gear_inches
