class UsersController < ApplicationController
  before_filter :authenticate_user!

  make_resourceful do
    actions :index, :show, :new, :create
  end

  def object_parameters
    return nil if action_name == "new"
    params.require(:user).permit(:email, :name, :password, :password_confirmation)
  end
  private :object_parameters
end
