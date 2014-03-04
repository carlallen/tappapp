class KioskController < ApplicationController
  before_filter :authenticate_user!, except: %w(index)
  before_action :set_tap, only: %w(show update destroy)

  # GET /taps
  # GET /taps.json
  def index
    @taps = Tap.all
  end

  # GET /taps/1.json
  def show
  end

end
