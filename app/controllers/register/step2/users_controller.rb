class Register::Step2::UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]

  def edit
  end

  def update
    @user.assign_attributes(user_params)
    if @user.save context: :step2
      redirect_to edit_register_step3_user_path(@user.uuid)
    else
      render :edit
    end
  end

  private
    def set_user
      @user = User.find_by uuid: params[:id]
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name)
    end
end
