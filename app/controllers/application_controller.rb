class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  make_resourceful do
    response_for(:show, :index) do |format|
        format.html
        format.json
        format.js
      end

    response_for(:create) do |format|
      format.html do
        redirect_to object_path, notice: I18n.t('make_resourceful.create.success', default: "Create successful!")
      end
      format.json { render action: 'show', status: :created, location: objects_path }
      format.js
    end

    response_for(:create_fails) do |format|
      format.html do
        set_default_flash :error, I18n.t('make_resourceful.create.fails', default: "There was a problem!")
        render action: :new, status: :unprocessable_entity
      end
      format.json { render json: current_object.errors, status: :unprocessable_entity }
      format.js
    end

    response_for(:update) do |format|
      format.html do
        redirect_to object_path, notice: I18n.t('make_resourceful.update.success', :default => "Save successful!")
      end
      format.json { render action: 'show', status: :created, location: objects_path }
    end

    response_for(:update_fails) do |format|
      format.html do
        set_default_flash :error, I18n.t('make_resourceful.update.fails', default: "There was a problem saving!")
        render action: :edit, status: :unprocessable_entity
      end
      format.json { render json: current_object.errors, status: :unprocessable_entity }
      format.js
    end

    response_for(:destroy) do |format|
      format.html do
        redirect_to objects_path, notice: I18n.t('make_resourceful.destroy.success', default: "Record deleted!")
      end
      format.json { head :no_content }
      format.js
    end
  end

  def authenticate_user_from_token!
    user_token = params[:user_token].presence
    user       = user_token && User.find_by_authentication_token(user_token.to_s)

    if user
      # Notice we are passing store false, so the user is not
      # actually stored in the session and a token is needed
      # for every request. If you want the token to work as a
      # sign in token, you can simply remove store: false.
      sign_in user, store: false
    end
  end
  private :authenticate_user_from_token!

end
