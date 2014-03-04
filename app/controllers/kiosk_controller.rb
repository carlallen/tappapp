class KioskController < ApplicationController
  # GET /taps
  # GET /taps.json
  def index
    @taps = Tap.all
  end

end
