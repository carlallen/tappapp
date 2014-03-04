module KioskHelper

  def addHead(index)

    @head_bubble_size = Random.new.rand(60..70)
    @head_bubble_color = "background-color: #ffffd" + Random.new.rand(0..9).to_s + ";"

    @head_bubble_width = "width: " + @head_bubble_size.to_s + "px;"
    @head_bubble_height = "height: " + @head_bubble_size.to_s + "px;"
    @head_bubble_radius = "border-radius: " + (@head_bubble_size / 2).to_s + "px;"

    @head_bubble_y_location = "top: " + Random.new.rand(15..35).to_s + "px;"
    @head_bubble_x_location = "left: " + index.to_s + "%;"

    @head_bubble_width + @head_bubble_height + @head_bubble_radius + @head_bubble_y_location + @head_bubble_x_location + @head_bubble_color

  end

  def carbonate(index)
    @bubble_size = Random.new.rand(30.0...50.0)
    @rand_z = Random.new.rand(10.0..50.0) / 100

    @bubble_width = "width: " + @bubble_size.to_s + "px;"
    @bubble_height = "height: " + @bubble_size.to_s + "px;"
    @head_bubble_radius = "border-radius: 50%;"

    @bubble_y_location = "left: " + (index * 10).to_s + "%;"
    @bubble_z_location = "opacity: " + @rand_z.round(1).to_s + ";"

    @bubble_movement = assignCO2Movement(Random.new.rand(20..80), Random.new.rand(1..15))

    @bubble_width + @bubble_height + @head_bubble_radius + @bubble_y_location + @bubble_z_location + @bubble_movement 

  end

  def assignCO2Movement(speed, oscillation)

    @webkit = "-webkit-animation: moveBubbles " + speed.to_s + "s linear infinite, sideWays " + oscillation.to_s + "s ease-in-out infinite alternate;"
    @moz_animation = "-moz-animation: moveBubbles " + speed.to_s + "s linear infinite, sideWays " + oscillation.to_s + "s ease-in-out infinite alternate;"
    @o_animation = "-o-animation:moveBubbles " + speed.to_s + "s linear infinite, sideWays " + oscillation.to_s + "s ease-in-out infinite alternate;"
    @animation = "moveBubbles " + speed.to_s + "s linear infinite, sideWays " + oscillation.to_s + "s ease-in-out infinite alternate;"

    @webkit + @moz_animation + @o_animation + @animation

  end
end