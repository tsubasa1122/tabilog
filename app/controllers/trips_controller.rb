class TripsController < ApplicationController
  def new
    @categories = Category.all
    @trip = Trip.new
    @trip.trip_photos.build
  end

  def index
    @trip_photos = TripPhoto.all
    if params[:id] == 'aa'
      @trips = Trip.page params[:page]
      @trips = @trips.search(s_title: params[:s_title]) if params[:s_title].present?
    else
      @trips = Trip.where('trips.address LIKE ?', "%#{params[:id]}%")
    end
  end

  def show
    @trip = Trip.find(params[:id])
    @trip_photos = TripPhoto.where(trip_id:  params[:id])
    @reviews = Review.where(trip_id: params[:id]).order(id: "DESC")

    @review_photos = ReviewPhoto.where(review_id: @reviews.ids )
    # puts @img
    @evaluations = Evaluation.all
    @evaluation_images = EvaluationImage.all
    @review = Review.new
    @review.review_photos.build
  end


  def wannago
    trip = Trip.find(params[:id])
    if trip.wannagoed_by?(current_user)
      wannago = current_user.wannagos.find_by(trip_id: trip.id)
      wannago.destroy
      render json: trip.id
    else
      wannago = current_user.wannagos.new(trip_id: trip.id)
      wannago.save
      render json: trip.id
    end
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.user_id = current_user.id
    # puts @trip.errors.full_messages
    if @trip.save
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
      redirect_to trip_path(@trip.id)
    else
      @categories = Category.all
      @trip = Trip.new
      @trip.trip_photos.build
      render :new
    end
  end

  def edit
    @trip = Trip.find(params[:id])
    @categories = Category.all
    @trip.trip_photos.build
  end

  def update
    @trip = Trip.find(params[:id])
    if @trip.update(trip_params)
      redirect_to trip_path(@trip.id)
    else
      @trip = Trip.find(params[:id])
      render :edit
    end
  end

  private

  def trip_params

    params.require(:trip).permit(:user_id, :address, :start_time, :end_time, :place_name, :place_detail, :telephone_number, :category_id, :latitude, :longitude, :business_hours,:regular_holiday ,:deleted_at)
  end
end
