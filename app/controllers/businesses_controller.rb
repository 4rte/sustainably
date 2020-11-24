class BusinessesController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    if params[:sub_category_id].present?
      @sub_category = SubCategory.find(params[:sub_category_id])
      @businesses = Business.where(category: @sub_category.category)
    else
      @businesses = Business.all
    end
  end

  def show
    @business = Business.find(params[:id])
    @review = Review.new
  end

  def new
    if current_user.admin?
      @business = Business.new
    end
  end

  def create
    if current_user.admin?
      @business = Business.new(business_params)
      @category = Category.find(params[:category_id])
      @category = @business.category
    end
  end
end
