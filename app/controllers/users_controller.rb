class UsersController < ApplicationController
  def dashboard
    @activity = Activity.new
    @activities = Activity.where(user_id: current_user.id).includes(:activity_type).page params[:page]
    #FIXME
    @activity_types = ActivityType.all
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
