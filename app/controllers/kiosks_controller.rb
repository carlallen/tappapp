class KiosksController < ApplicationController
 
  layout 'kiosk'

  def show
     @taps = Tap.all
  end
end
