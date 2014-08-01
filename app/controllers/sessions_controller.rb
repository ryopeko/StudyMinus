class SessionsController < ApplicationController
  def new
  end

  def create
    auth = request.env['omniauth.auth']

    user = User.find_by(provider: auth['provider'], uid: auth['uid']) || User.create_with_omniauth(auth)
  end

  def destroy
  end
end
