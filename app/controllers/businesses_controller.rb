class BusinessesController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    raise
    @businesses = Business.all
  end
end
