class ActivitiesController < ApplicationController
  def index
  end

  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activities_params)
    @activity.user_id = current_user.id

    if @activity.save
      redirect_to @activity
    else
      render :create
    end
  end

  def show
  end

  private

  def activities_params
    params.require(:activity).permit(:activity_type_id, :description)
  end
end
