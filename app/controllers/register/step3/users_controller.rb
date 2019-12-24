class Register::Step3::UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]

  def edit
  end

  def update
    @user.assign_attributes(user_params)

    if @user.save @user
      redirect_to "/"
    else
      render :edit
    end
  end

  private
    def set_user
      @user = User.find_by uuid: params[:id]
    end

    def user_params
      params.require(:user).permit(:address, :phone)
    end
end
