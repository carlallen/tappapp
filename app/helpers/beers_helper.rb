module BeersHelper
  def srm(value)
    content_tag( "span", "#{value} °L", class: "srm", style: "background-color:#{srm_to_html_color(value)};") if value > 0
  end
end
