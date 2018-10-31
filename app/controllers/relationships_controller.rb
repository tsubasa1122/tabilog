class RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def follow
    user = User.find(params[:id])
    if current_user.following?(user)
      current_user.unfollow!(user)
    else
      current_user.follow!(user)
    end
    render partial: 'users/user', locals: {user: user}
  end

  def count
    render json: current_user.followed_users.count
  end

  def tmp
    if params[:dotti] == "follow"
      user = User.find(params[:dareno])
      render partial: 'follow', locals: {forf: user.followed_users, a: user.name, b: params[:dotti]}
    else
      user = User.find(params[:dareno])
      render partial: 'follow', locals: {forf: user.followers, a: user.name, b: params[:dotti]}
    end
  end
end
