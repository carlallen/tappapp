module KioskHelper

  def addHead(index)

    hb = HeadBubble.new(index)

    head_bubble_color = "background-color: #ffffd#{Random.new.rand(0..9)};"
    head_bubble_width = "width: #{hb.size}px;"
    head_bubble_height = "height: #{hb.size}px;"

    head_bubble_x_location = "left: #{hb.x * 2}%;"
    head_bubble_y_location = "top: #{hb.y}px;"

    head_bubble_width + head_bubble_height + head_bubble_y_location + head_bubble_x_location + head_bubble_color

  end

  def carbonate(index)

    bb = BeerBubble.new

    bubble_width = "width: #{bb.size}px;"
    bubble_height = "height: #{bb.size}px;"

    bubble_y_location = "left: #{index * 6}%;"
    bubble_z_location = "opacity: #{bb.depth.round(1)};"

    bubble_movement = assignCO2Movement(bb.size, bb.amplitude)

    bubble_width + bubble_height + bubble_y_location + bubble_z_location + bubble_movement 

  end

  def assignCO2Movement(speed, amplitude)

    webkit = "-webkit-animation: moveBubbles #{speed}s linear infinite, sideWays #{amplitude}s ease-in-out infinite alternate;"
    moz_animation = "-moz-animation: moveBubbles #{speed}s linear infinite, sideWays #{amplitude}s ease-in-out infinite alternate;"
    o_animation = "-o-animation:moveBubbles #{speed}s linear infinite, sideWays #{amplitude}s ease-in-out infinite alternate;"
    animation = "moveBubbles #{speed}s linear infinite, sideWays #{amplitude}s ease-in-out infinite alternate;"

    webkit + moz_animation + o_animation + animation

  end
end