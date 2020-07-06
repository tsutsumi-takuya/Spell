class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.update(user_params)

    if
      @user.save
      redirect_to user_path(@user.id)
    else
      render action: :edit
    end
  end

  def check
    @user = User.find(params[:id])
  end

  def withdrawl
    @user = User.find(current_user.id)
    @user.update(is_active: "Invalid")
    @user.destroy
    reset_session
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:active, :name, :introduction, :profile_image)
  end
end
