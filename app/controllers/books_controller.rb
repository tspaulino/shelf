class BooksController < InheritedResources::Base
  actions :index, :show

  def index
    @books = Book.paginate :page => params[:page], :per_page => 20
  end
end
