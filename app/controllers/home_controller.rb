class HomeController < ApplicationController
  def top
    if user_signed_in?
      @user = User.find(current_user.id)
    end
    @evaluation_image = EvaluationImage.new
  end

  def about

  end

  def create
    evaluation_image = EvaluationImage.new(evaluation_image_params)
    evaluation_image.save
    redirect_to root_path
  end

  private
  def evaluation_image_params
    params.require(:evaluation_image).permit(:image, :id)
  end

end
