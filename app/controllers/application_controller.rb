class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  before_action :authorize

  include SessionsHelper

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

  private

  def not_found
    render file: Rails.root.join('public/404.html'), status: :not_found
  end
end
