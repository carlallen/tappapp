class BeerBubble

  attr_accessor :size
  attr_accessor :depth
  attr_accessor :amplitude

  def initialize

    @size_min = 10.0
    @size_max = 20.0
    
    @depth_min = 10.0
    @depth_max = 50.0

    @amplitude_min = 1.0
    @amplitude_max = 20.0

    @size = Random.new.rand(@size_min..@size_max)
    @depth = Random.new.rand(@depth_min..@depth_max) / 100
    
    if (size > (@size_max / 2))
      @amplitude = Random.new.rand((@amplitude_max / 2)..@amplitude_max) 
    else 
      @amplitude = Random.new.rand(@amplitude_min..(@amplitude_max / 2))  
    end 
    
  end

end
