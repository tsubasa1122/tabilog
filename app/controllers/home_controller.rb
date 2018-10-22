class HomeController < ApplicationController
  def top
    if user_signed_in?
      @user = User.find(current_user.id)
    end
  end

  def about

  end

end
