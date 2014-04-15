module BeersHelper
  def srm(value)
    content_tag( "span", "#{value} °L", class: "srm srm-#{value + 1}") if value > 0
  end
end
