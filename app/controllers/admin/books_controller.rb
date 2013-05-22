class Admin::BooksController < AdminController
  inherit_resources

  def index
    @books = Book.paginate(:page => params[:page], :per_page => 20)
  end
end
