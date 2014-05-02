class TapsController < ApplicationController
  before_filter :authenticate_user!, except: %w(index kiosk)
  make_resourceful do
    actions :all
    member_actions :kiosk

    response_for(:update) do |format|
      format.html do
        redirect_to(taps_path, notice: I18n.t('make_resourceful.update.success', :default => "Save successful!"))
      end
      format.json { head :no_content }
    end

    response_for(:create) do |format|
      format.html do
        redirect_to(taps_path, notice: I18n.t('make_resourceful.create.success', :default => "Create successful!"))
      end
      format.json { render action: 'show', status: :created, location: objects_path }
    end
  end

  # GET /kiosk
  def kiosk
    @taps = Tap.all
    render layout: false
  end

  def object_parameters
    return nil if %w(new create).include? action_name
    params.require(:tap).permit(:beer_name, :sensor_id)
  end
  private :object_parameters
end
