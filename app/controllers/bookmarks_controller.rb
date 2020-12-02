class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.all
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @business = Business.find(params[:business_id])
    @bookmark = Bookmark.new
    @bookmark.business = @business
    @bookmark.user = current_user
    if @bookmark.save!
      redirect_to business_path(@bookmark.business_id)
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to business_path(@bookmark.business_id)
  end
end
