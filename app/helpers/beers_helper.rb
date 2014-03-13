module BeersHelper
  def srm(value)
    content_tag( "span", "#{value} °L", class: "srm srm-#{value}") if value > 0
  end
end
