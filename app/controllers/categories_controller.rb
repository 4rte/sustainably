class CategoriesController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @categories = Category.all
    # raise
  end

  def show
    @category = Category.find(params[:id])
  end


end
