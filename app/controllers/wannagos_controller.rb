class WannagosController < ApplicationController
  def index
    @wannagos = Wannago.where(user_id: current_user.id)
    @user = User.find(current_user.id)
    @trip_photos = TripPhoto.all
  end
end
