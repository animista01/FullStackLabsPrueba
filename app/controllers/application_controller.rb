class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def is_admin
    # puts "----current_user #{current_user.as_json}"
    if current_user.admin?
      return true
    else
      redirect_to '/', notice: 'Unauthorized.' 
    end
  end
end
