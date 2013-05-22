require 'spec_helper'

describe Admin::BooksController do
  include Devise::TestHelpers

  before (:each) do
    @admin = Admin.create! :name => "Admin Testing", :username => "admin", :email => "admin@domain.com", :password => "testing123", :password_confirmation => "testing123"
    sign_in :admin, @admin
  end

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

  describe "GET new" do
    it "assigns a new book as @book" do
      get :new, {}
      assigns(:book).should be_a_new(Book)
    end
  end

  describe "GET edit" do
    it "assigns the requested book as @book" do
      book = Book.create! valid_attributes
      get :edit, {:id => book.to_param}
      assigns(:book).should eq(book)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Admin::Book" do
        expect {
          post :create, {:book => valid_attributes}
        }.to change(Book, :count).by(1)
      end

      it "assigns a newly created book as @book" do
        post :create, {:book => valid_attributes}
        assigns(:book).should be_a(Book)
        assigns(:book).should be_persisted
      end

      it "redirects to the created book" do
        post :create, {:book => valid_attributes}
        response.should redirect_to(admin_book_path(Book.last))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved book as @book" do
        Book.any_instance.stub(:save).and_return(false)
        post :create, {:book => {  }}
        assigns(:book).should be_a_new(Book)
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested book" do
        book = Book.create! valid_attributes
        Book.any_instance.should_receive(:update_attributes).with({ "these" => "params" })
        put :update, {:id => book.to_param, :book => { "these" => "params" }}
      end

      it "assigns the requested book as @book" do
        book = Book.create! valid_attributes
        put :update, {:id => book.to_param, :book => valid_attributes}
        assigns(:book).should eq(book)
      end

      it "redirects to the book" do
        book = Book.create! valid_attributes
        put :update, {:id => book.to_param, :book => valid_attributes}
        response.should redirect_to(admin_book_path(book))
      end
    end

    describe "with invalid params" do
      it "assigns the book as @book" do
        book = Book.create! valid_attributes
        Book.any_instance.stub(:save).and_return(false)
        put :update, {:id => book.to_param, :book => {  }}
        assigns(:book).should eq(book)
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested book" do
      book = Book.create! valid_attributes
      expect {
        delete :destroy, {:id => book.to_param}
      }.to change(Book, :count).by(-1)
    end

    it "redirects to the books list" do
      book = Book.create! valid_attributes
      delete :destroy, {:id => book.to_param}
      response.should redirect_to(admin_books_url)
    end
  end

end
