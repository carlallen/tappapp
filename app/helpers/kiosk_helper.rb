module KioskHelper

  def is_kiosk
    request.original_url.include? "kiosk"
  end

end