class Register::Step1::UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    if @user.save context: :step1
      redirect_to edit_register_step2_user_path(@user.uuid)
    else
      render :new
    end
  end

  def update
    @user.assign_attributes(user_params)

    if @user.save context: :step1
      redirect_to edit_register_step2_user_path(@user.uuid)
    else
      render :edit
    end
  end

  private
    def set_user
      @user = User.find_by uuid: params[:id]
    end

    def user_params
      uuid = SecureRandom.uuid.delete("-")
      params.require(:user).permit(:email, :passsword).merge(uuid: uuid)
    end
end
