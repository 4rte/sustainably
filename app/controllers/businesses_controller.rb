class BusinessesController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    # raise
    if params[:sub_category_id].present?
      @sub_category = SubCategory.find(params[:sub_category_id])
      # raise
      @businesses = Business.joins(:business_sub_categories).where(business_sub_categories: { sub_category: @sub_category })
    else
      @businesses = Business.all
    end
  end

  def show
    @business = Business.find(params[:id])
    @review = Review.new
  end

  def new
    # raise
    if current_user.admin?
      @business = Business.new
    end
  end

  def create
    # raise
    if current_user.admin?
      @business = Business.new(business_params)
      if @business.save
        raise
        redirect_to @business, notice: "Tool was successfully added"
      else
        render :new
      end
    end
  end

  def business_params
    params.require(:business).permit(:name, :description, :address)
  end
end
