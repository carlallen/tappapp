module BeersHelper
  def srm(value)
    content_tag( "span", "#{value} °L", class: "srm srm-#{value} pad-5") if value > 0
  end
end
