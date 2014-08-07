class UsersController < ApplicationController
  def dashboard
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
