class UsersController < ApplicationController
  def dashboard
    @activities = Activity.where(user_id: current_user.id)
  end

  def edit
  end

  def udpate
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
