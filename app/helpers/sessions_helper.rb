module SessionsHelper
  def current_user
    user_id = session[:user_id] || return
    @current_user ||= User.find_by(id: user_id)
  end

  def signed_in?
    !current_user.nil?
  end
end
