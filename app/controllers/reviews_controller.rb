class ReviewsController < ApplicationController



  def favorite
    review = Review.find(params[:id])
    if review.favorited_by?(current_user)
      fav = current_user.favorites.find_by(review_id: review.id)
      fav.destroy
      render json: review.id
    else
      fav = current_user.favorites.new(review_id: review.id)
      fav.save
      render json: review.id
    end
  end


  def create
    @trip = Trip.find(params[:trip_id])
    @review = current_user.reviews.new(review_params)
    @review.trip_id = params[:trip_id]
    @review.save
    # puts @review.errors.full_messages
    params["review"]["review_photos_attributes"]["0"]["review_image"].size().times do |i|
      if i == 0
        next
      end
      if i == 6
        break
      end
      rp = ReviewPhoto.new(review_id: @review.id , review_image: params["review"]["review_photos_attributes"]["0"]["review_image"][i])
      rp.save
    end

    render partial: 'trip', locals: {review: @review}

  end

  def destroy

  end

  private

  def review_params
    params.require(:review).permit(:evaluation_id, :trip_id, :user_id, :comment, :month, :timezone_start, :timezone_end, :deleted_at )
  end

end


