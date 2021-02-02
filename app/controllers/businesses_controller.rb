class BusinessesController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    if params[:query].present?
      @businesses = Business.search_by_name(params[:query])
      # @businesses = Business.near(params[:query], 100)
      @markers = @businesses.geocoded.map do |business|
     {
      lat: business.latitude,
      lng: business.longitude,
      infoWindow: render_to_string(partial: "info_window", locals: { business: business }),
      image_url: helpers.asset_url('marker.svg')
     }
      end
    elsif params[:category_id].present?
      @category = Category.find(params[:category_id])
      @sub_categories = @category.sub_categories
      # raise
      @businesses = []
      @sub_categories.each do |sub_category|
        @businesses << sub_category.businesses.distinct # is array
      end
      @businesses = @businesses.flatten
      if params[:sub_category_id].present?
        @sub_category = SubCategory.find(params[:sub_category_id])
        @businesses = @businesses.select {|business| business.sub_categories.include?(@sub_category)}
      end
    else
      @businesses = Business.all
    end
  end

  def show
    @business = Business.find(params[:id])
    @review = Review.new
    @user = current_user
    @bookmark = Bookmark.find_by(business: @business, user: @user)
    @marker = [{lat: @business.latitude,
    lng: @business.longitude}
    ]
  end

  def new
    if current_user.admin?
      @business = Business.new
    end
  end

  def create
    if current_user.admin?
      @business = Business.new(business_params)
      # @sub_category = SubCategory.find(params[:business][:business_sub_categories][:sub_category_ids])
      sub_categories = params.dig(:business, :sub_category_ids)

      # @business = Business.joins(:business_sub_categories).create_with(business_sub_categories: { sub_category: @sub_category })

      if @business.save
        sub_categories.each do |sub_category_id|
          BusinessSubCategory.create(business: @business, sub_category_id: sub_category_id)
        end
  
        redirect_to @business, notice: "Business was successfully added"
      else
        render :new
      end
    end
  end

  
  def edit
    if current_user.admin?
      find_business
    end
  end

  def update
    if current_user.admin?
      find_business
      sub_categories = params.dig(:business, :sub_category_ids)
      if @business.update(business_params)
        sub_categories.each do |sub_category_id|
          BusinessSubCategory.update(business: @business, sub_category_id: sub_category_id)
        end
        redirect_to @business, notice: "Changes were successfully saved"
      else
        render 'edit'
      end
    end
  end
  
  def destroy
    if current_user.admin?
      find_business
      @business.destroy
      redirect_to categories_path, notice: "Business was successfully deleted"
    end
  end

  private

  def find_business
    @business = Business.find(params[:id])
  end
  
  def business_params
    params.require(:business).permit(:name, :description, :address, :url, :photo, business_sub_category_attributes: [:sub_category_id, :business_sub_category_id],
      sub_category_ids: [] )
  end
end


