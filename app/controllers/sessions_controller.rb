class SessionsController < ApplicationController
  skip_before_action :authorize, only: [:new, :create]
  before_action :redirect_if_signed_in, only: [:new, :create]

  def new
  end

  def create
    auth = request.env['omniauth.auth']

    user = User.find_by(provider: auth['provider'], uid: auth['uid']) || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    redirect_to dashboard_path
  end

  def destroy
  end

  private

  def redirect_if_signed_in
    redirect_to dashboard_path if signed_in?
  end
end
