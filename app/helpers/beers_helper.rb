module BeersHelper
  def srm(value)
    content_tag( "span", "#{value} °L", class: "srm srm-#{value}") if value > 0
  end

  # def glass_srm(value)
  #   content_tag( "img", "#{value} °L", src: image_path('beerglass.png'), class: "srm srm-#{value}") if value > 0
  # end
end
