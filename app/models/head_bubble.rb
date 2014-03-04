class HeadBubble

  attr_accessor :size
  attr_accessor :x
  attr_accessor :y

  def initialize(index)

    @size_min = 60
    @size_max = 70

    @y_min = 15
    @y_max = 35

    @size = getRand(@size_min, @size_max)
    @x = index
    @y = getRand(@y_min, @y_max)

  end

  def getRand(a, b)
    Random.new.rand(a..b)
  end

end
