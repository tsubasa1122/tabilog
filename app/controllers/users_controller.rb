class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def followings
    @user = User.find(params[:id])
  end

  def followers
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      @user = User.find(params[:id])
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path
  end



  private

  def user_params
    params.require(:user).permit(:name, :user_image, :header_image, :description , :account_name, :deleted_at)
  end
end

