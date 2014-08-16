class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authorize

  def authorize
    redirect_to signin_path unless signed_in?
  end

  def signin(user)
    session[:user_id] = user.id
    @current_user = user
  end

  def signout
    session[:user_id] = nil
    reset_session
    @current_user = nil
  end

  def current_user
    user_id = session[:user_id] || return
    @current_user ||= User.find_by(id: user_id)
  end

  def signed_in?
    !current_user.nil?
  end
end
