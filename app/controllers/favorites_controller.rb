class FavoritesController < ApplicationController
  def index
    @favorites = Favorite.where(user_id: current_user.id)
    @user = User.find(current_user.id)
  end
end
