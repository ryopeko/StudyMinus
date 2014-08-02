class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authorize

  def authorize
    redirect_to signin_path unless signed_in?
  end

  def current_user
    user_id = session[:user_id] || return
    @current_user ||= User.find_by(id: user_id)
  end

  def signed_in?
    !current_user.nil?
  end
end
