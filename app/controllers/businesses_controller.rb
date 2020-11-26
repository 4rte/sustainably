class BusinessesController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    # raise
    if params[:sub_category_id].present?
      @sub_category = SubCategory.find(params[:sub_category_id])
      # raise
      @businesses = Business.joins(:business_sub_categories).where(business_sub_categories: { sub_category: @sub_category }).distinct
    else
      @businesses = Business.all
      # raise
    end
  end

  def show
    @business = Business.find(params[:id])
    @review = Review.new
    @user = current_user
    # raise
    @marker = [{lat: @business.latitude,
    lng: @business.longitude}
    ]
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
      # @sub_category = SubCategory.find(params[:business][:business_sub_categories][:sub_category_ids])
      sub_categories = params.dig(:business, :sub_category_ids)
      # raise
      # @business = Business.joins(:business_sub_categories).create_with(business_sub_categories: { sub_category: @sub_category })
      # raise
      if @business.save
        sub_categories.each do |sub_category_id|
          BusinessSubCategory.create(business: @business, sub_category_id: sub_category_id)
        end
        # raise
        redirect_to @business, notice: "Business was successfully added"
      else
        render :new
      end
    end
  end

  def business_params
    params.require(:business).permit(:name, :description, :address, :photo, business_sub_category_attributes: [:sub_category_id, :business_sub_category_id],
      sub_category_ids: [] )
  end
end


