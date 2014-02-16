module BootstrapHelper
  def icon_link_to(icon, name = nil, options = nil, html_options = nil, &block)
    html_options, options, name = options, name, yield if block_given?
    options ||= {}

    link_to options, html_options do
      icon_with_text(icon, name)
    end
  end

  def icon_with_text(icon, text)
    tag("span", class: "glyphicon glyphicon-#{icon}") + text
  end

  %w(default primary success info warning danger).each do |style|
    define_method "#{style}_link_to" do |name = nil, options = {}, html_options = {}, &block|
      if block_given?
        options[:class] = "btn btn-#{style} #{options[:class]}"
      else
        html_options[:class] = "btn btn-#{style} #{html_options[:class]}"
      end

      link_to(name, options, html_options, &block)
    end
  end

  # def primary_link_to(name = nil, options = {}, html_options = {}, &block)
  #   if block_given?
  #     options[:class] = "btn btn-primary #{options[:class]}"
  #   else
  #     html_options[:class] = "btn btn-primary #{html_options[:class]}"
  #   end

  #   link_to(name, options, html_options, &block)
  # end

end
