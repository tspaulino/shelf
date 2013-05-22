class Admin::ReviewsController < AdminController
  inherit_resources

  def index
    @reviews = Review.paginate(:page => params[:page], :per_page => 20)
  end
end
