class BeerBubble

  attr_accessor :size
  attr_accessor :depth
  attr_accessor :amplitude

  def initialize

    @size_min = 5.0
    @size_max = 15.0
    
    @depth_min = 10.0
    @depth_max = 50.0

    @amplitude_min = 1.0
    @amplitude_max = 20.0

    @size = getRand(@size_min, @size_max)
    @depth = getRand(@depth_min, @depth_max) / 100
    @amplitude = (size > (@size_max / 2)) ? getRand((@amplitude_max / 2), @amplitude_max) : getRand(@amplitude_min, (@amplitude_max / 2))  
  end

  def getRand(a, b)
    Random.new.rand(a..b)
  end

end
