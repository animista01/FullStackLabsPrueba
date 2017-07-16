class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  skip_before_filter :verify_authenticity_token
  def is_admin
    # puts "----current_user #{current_user.as_json}"
    if current_user.admin?
      return true
    else
      redirect_to '/', notice: 'Unauthorized.' 
    end
  end

  def is_costumer
    # puts "----current_user #{current_user.as_json}"
    if current_user.role_id == 1
      return true
    else
      redirect_to '/', notice: 'Unauthorized.' 
    end
  end

  def is_support_agent
    # puts "----current_user #{current_user.as_json}"
    if current_user.role_id == 2
      return true
    else
      redirect_to '/', notice: 'Unauthorized.' 
    end
  end

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || current_user.admin? ? users_path : tickets_path
  end
end
