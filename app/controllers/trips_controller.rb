class TripsController < ApplicationController
  def new
    @categories = Category.all
    @trip = Trip.new
    @trip.trip_photos.build
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.save
    # puts @trip.errors.full_messages
    params["trip"]["trip_photos_attributes"]["0"]["trip_image"].size().times do |i|
      if i == 0
        next
      end
      if i == 6
        break
      end
      tp = TripPhoto.new(trip_id: @trip.id, trip_image: params["trip"]["trip_photos_attributes"]["0"]["trip_image"][i])
      tp.save

    end
    redirect_to root_path
  end

  def show
    @trip = Trip.find(params[:id])
    @trip_photos = TripPhoto.where(trip_id:  params[:id])
    @reviews = Review.where(trip_id: params[:id])

    @review_photos = ReviewPhoto.where(review_id: @reviews.ids )
    # puts @img
  end

  def index
    @trips = Trip.all
  end

  private

  def trip_params

    params.require(:trip).permit(:address, :start_time, :end_time, :place_name, :place_detail, :telephone_number, :category_id, :latitude, :longitude, :business_hours,:regular_holiday ,:deleted_at)
  end
end
