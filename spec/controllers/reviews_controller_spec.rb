require 'spec_helper'

describe ReviewsController do
  include Devise::TestHelpers

  before (:each) do
    @user = User.create! :name => "Testing", :username => "testing", :email => "test@domain.com", :password => "testing123", :password_confirmation => "testing123"
    sign_in @user
  end


  let(:valid_attributes) { { :book_attributes => {:title => "Testing title", :isbn_number => "1234567890"}, :user_id => @user.id, :rate => 3 } }

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Review" do
        expect {
          post :create, {:review => valid_attributes}
        }.to change(Review, :count).by(1)
      end

      it "assigns a newly created review as @review" do
        post :create, {:review => valid_attributes}
        assigns(:review).should be_a(Review)
        assigns(:review).should be_persisted
      end

      it "redirects to the created review" do
        post :create, {:review => valid_attributes}
        response.should redirect_to(@user)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved review as @review" do
        Review.any_instance.stub(:save).and_return(false)
        post :create, {:review => {  }}
        assigns(:review).should be_a_new(Review)
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested review" do
        review = Review.create! valid_attributes
        Review.any_instance.should_receive(:update_attributes).with({ "these" => "params" })
        put :update, {:id => review.to_param, :review => { "these" => "params" }}
      end

      it "assigns the requested review as @review" do
        review = Review.create! valid_attributes
        put :update, {:id => review.to_param, :review => valid_attributes}
        assigns(:review).should eq(review)
      end

    end

    describe "with invalid params" do
      it "assigns the review as @review" do
        review = Review.create! valid_attributes
        Review.any_instance.stub(:save).and_return(false)
        put :update, {:id => review.to_param, :review => {  }}
        assigns(:review).should eq(review)
      end
    end
  end

end
