class KioskController < ApplicationController
  def index
    @taps = Tap.all
  end
end
