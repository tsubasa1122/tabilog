class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.page(params[:page])
    @users = @users.search(s_title: params[:s_title]) if params[:s_title].present?
  end

  def show
    @user = User.find(params[:id])
    @reviews = Review.where(user_id: params[:id])
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

