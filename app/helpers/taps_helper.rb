module TapsHelper
  include BeersHelper

  def set_glass_color(index, percent)
    reg = "background-image: linear-gradient(white, white #{percent}%, #{srm_to_html_color(index)} #{percent}%, #{srm_to_html_color(index)});"
    webkit = "background-image: -webkit-linear-gradient(white, white #{percent}%, #{srm_to_html_color(index)} #{percent}%, #{srm_to_html_color(index)});"
    moz = "background-image: -moz-linear-gradient(white, white #{percent}%, #{srm_to_html_color(index)} #{percent}%, #{srm_to_html_color(index)});"
    opera = "background-image: -o-linear-gradient(white, white #{percent}%, #{srm_to_html_color(index)} #{percent}%, #{srm_to_html_color(index)});"

    reg + webkit + moz + opera
  end


  def srm_to_html_color(index)
    case index
    when 0..1
      "#fee799"
    when 2
      "#fdd978"
    when 3
      "#fdcb5a"
    when 4
      "#fcc143"
    when 5
      "#f7b324"
    when 6
      "#f5a800"
    when 7
      "#ee9e00"
    when 8
      "#e69100"
    when 9
      "#e38901"
    when 10
      "#da7e01"
    when 11
      "#d37400"
    when 12
      "#cb6c00"
    when 13
      "#c66401"
    when 14
      "#bf5c01"
    when 15
      "#b65300"
    when 16
      "#b04f00"
    when 17
      "#ac4701"
    when 18
      "#a24001"
    when 19
      "#9c3900"
    when 20
      "#963500"
    when 21
      "#912f00"
    when 22
      "#8c2d01"
    when 23
      "#832501"
    when 24
      "#7e1f01"
    when 25
      "#771c01"
    when 26
      "#721b00"
    when 27
      "#6c1501"
    when 28
      "#670f01"
    when 29
      "#620f01"
    when 30
      "#5b0d01"
    when 31
      "#560c03"
    when 32
      "#5d0a02"
    when 33
      "#500a08"
    when 34
      "#4a0605"
    when 35
      "#440706"
    when 36
      "#420807"
    when 37
      "#3c0908"
    when 38
      "#390708"
    when 39
      "#39080b"
    when 40
      "#35090a"
    else
      "#FFFFFF"
    end
  end
end
