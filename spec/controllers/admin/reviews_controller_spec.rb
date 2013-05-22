require 'spec_helper'


describe Admin::ReviewsController do
  include Devise::TestHelpers

  before (:each) do
    @admin = Admin.create! :name => "Admin Testing", :username => "admin", :email => "admin@domain.com", :password => "testing123", :password_confirmation => "testing123"
    sign_in :admin, @admin
  end

let(:valid_attributes) { { :book_attributes => {:title => "Testing title", :isbn_number => "1234567890"}, :user_id => @admin.id, :rate => 3 } }

  describe "GET index" do
    it "assigns all admin_reviews as @admin_reviews" do
      review = Review.create! valid_attributes
      get :index, {}
      assigns(:reviews).should eq([review])
    end
  end

  describe "GET show" do
    it "assigns the requested admin_review as @admin_review" do
      review = Review.create! valid_attributes
      get :show, {:id => review.to_param}
      assigns(:review).should eq(review)
    end
  end

  describe "GET new" do
    it "assigns a new admin_review as @admin_review" do
      get :new, {}
      assigns(:review).should be_a_new(Review)
    end
  end

  describe "GET edit" do
    it "assigns the requested admin_review as @admin_review" do
      review = Review.create! valid_attributes
      get :edit, {:id => review.to_param}
      assigns(:review).should eq(review)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Admin::Review" do
        expect {
          post :create, {:review => valid_attributes}
        }.to change(Review, :count).by(1)
      end

      it "assigns a newly created admin_review as @admin_review" do
        post :create, {:review => valid_attributes}
        assigns(:review).should be_a(Review)
        assigns(:review).should be_persisted
      end

      it "redirects to the created admin_review" do
        post :create, {:review => valid_attributes}
        response.should redirect_to(admin_review_path(Review.last))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved admin_review as @admin_review" do
        Review.any_instance.stub(:save).and_return(false)
        post :create, {:review => {  }}
        assigns(:review).should be_a_new(Review)
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested admin_review" do
        review = Review.create! valid_attributes
        Review.any_instance.should_receive(:update_attributes).with({ "these" => "params" })
        put :update, {:id => review.to_param, :review => { "these" => "params" }}
      end

      it "assigns the requested admin_review as admin_review" do
        review = Review.create! valid_attributes
        put :update, {:id => review.to_param, :review => valid_attributes}
        assigns(:review).should eq(review)
      end

      it "redirects to the admin_review" do
        review = Review.create! valid_attributes
        put :update, {:id => review.to_param, :review => valid_attributes}
        response.should redirect_to(admin_review_path(review))
      end
    end

    describe "with invalid params" do
      it "assigns the admin_review as @admin_review" do
        review = Review.create! valid_attributes
        Review.any_instance.stub(:save).and_return(false)
        put :update, {:id => review.to_param, :review => {  }}
        assigns(:review).should eq(review)
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested admin_review" do
      review = Review.create! valid_attributes
      expect {
        delete :destroy, {:id => review.to_param}
      }.to change(Review, :count).by(-1)
    end

    it "redirects to the admin_reviews list" do
      review = Review.create! valid_attributes
      delete :destroy, {:id => review.to_param}
      response.should redirect_to(admin_reviews_path)
    end
  end

end
