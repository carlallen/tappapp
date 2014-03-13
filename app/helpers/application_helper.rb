module ApplicationHelper
  include BootstrapHelper

  def app_name
    ENV["APP_NAME"] || "tappapp"
  end

end
