class TapsController < ApplicationController
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

  # POST /taps
  # POST /taps.json
  def create
    @tap = Tap.new

    respond_to do |format|
      if @tap.save
        format.html { redirect_to taps_path, notice: 'Tap was successfully created.' }
        format.json { render action: 'show', status: :created, location: @tap }
      else
        format.json { render json: @tap.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /taps/1
  # PATCH/PUT /taps/1.json
  def update
    respond_to do |format|
      if @tap.update(tap_params)
        format.html { redirect_to taps_path, notice: 'Tap was successfully updated.' }
        format.json { head :no_content }
      else
        format.json { render json: @tap.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /taps/1
  # DELETE /taps/1.json
  def destroy
    @tap.destroy
    respond_to do |format|
      format.html { redirect_to taps_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tap
      @tap = Tap.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tap_params
      params.require(:tap).permit(:beer_name, :sensor_id)
    end
end
