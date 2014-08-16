class ActivityTypesController < ApplicationController
  def new
    @activity_type = ActivityType.new
  end

  def create
    @activity_type = ActivityType.new(activity_type_params)

    if @activity_type.save
      redirect_to @activity_type, notice: 'Activity Type successfuly created.'
    else
      render :new, status: :bad_request
    end
  end

  def show
    @activity_type = ActivityType.find(params[:id])
  end

  private

  def activity_type_params
    params.fetch(:activity_type).permit(:name)
  end
end
