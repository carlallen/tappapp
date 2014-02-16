module BeersHelper
  def srm(value)
    content_tag("span", value, class: "srm srm-#{value}")
  end
end
