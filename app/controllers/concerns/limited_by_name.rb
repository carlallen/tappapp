module LimitedByName
  extend ActiveSupport::Concern

  def current_objects
    @current_objects ||= find_objects
  end

  def find_objects
    if params[:name].present?
      current_model.where("lower(name) like lower(?)", "%#{params[:name]}%").load
    else
      current_model.all
    end
  end
  private :find_objects
end