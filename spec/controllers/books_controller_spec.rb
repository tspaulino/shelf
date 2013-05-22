require 'spec_helper'


describe BooksController do

  let(:valid_attributes) { { :title => "My Title", :isbn_number => "1234567890" } }

  describe "GET index" do
    it "assigns all books as @books" do
      book = Book.create! valid_attributes
      get :index, {}
      assigns(:books).should eq([book])
    end
  end

  describe "GET show" do
    it "assigns the requested book as @book" do
      book = Book.create! valid_attributes
      get :show, {:id => book.to_param}
      assigns(:book).should eq(book)
    end
  end

end
