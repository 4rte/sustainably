class SubCategoriesController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @sub_categories = Category.find(params[:category_id]).sub_categories
  end
end
