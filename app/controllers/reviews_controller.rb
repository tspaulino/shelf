class ReviewsController < InheritedResources::Base
  actions :new, :create, :update
  before_filter :authenticate_user!

  def new
    @review = current_user.reviews.build
    @book = @review.build_book
  end

  def create
    @review = current_user.reviews.build(params[:review])
    respond_to do |format|
      if @review.save
        format.html { redirect_to user_path(current_user), flash[:notice] => "Review successfully created!" }
        format.js { render :partial => 'update_rate', flash[:notice] => "Review successfully created!", :layout => false }
      else
        format.html { render 'new' }
        format.js { render :partial => 'update_rate', flash[:alert] => "Error adding this review", :layout => false }
      end
    end
  end

  def update
    @review = current_user.reviews.find(params[:id])
    @review.update_attributes(params[:review])
    respond_to do |format|
      format.js { render :partial => 'update_rate', flash[:notice] => "Review successfully created!", :layout => false }
    end
  end

end
