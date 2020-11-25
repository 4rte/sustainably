class ReviewsController < ApplicationController
  def create
    @business = Business.find(params[:business_id])
    @review = Review.new(review_params)
    @review.business = @business
    @review.user = current_user
    if @review.save
      redirect_to business_path(@business)
    else
      render 'businesses/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
