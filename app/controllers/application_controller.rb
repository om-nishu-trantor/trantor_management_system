class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(user)
    stored_location_for(user) || users_show_url(user)
  end

  def log_error(exception)
  	logger.error("[Exception] #{ exception.inspect }") and return
  end
end
