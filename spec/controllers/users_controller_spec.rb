require 'spec_helper'

describe UsersController do

  let(:valid_attributes) { {:name => "Testing", :username => "testing", :email => "test@domain.com", :password => "testing123", :password_confirmation => "testing123" } }

  before (:each) do
    @user = User.create! valid_attributes
  end

  describe "GET show" do
    it "assigns the requested user as @user" do
      get :show, {:id => @user.to_param}
      assigns(:user).should eq(@user)
    end
  end

  describe "GET edit" do
    it "assigns the requested user as @user" do
      get :edit, {:id => @user.to_param}
      assigns(:user).should eq(@user)
    end
  end


  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested user" do
        User.any_instance.should_receive(:update_attributes).with({ "these" => "params" })
        put :update, {:id => @user.to_param, :user => { "these" => "params" }}
      end

      it "assigns the requested user as @user" do
        put :update, {:id => @user.to_param, :user => valid_attributes}
        assigns(:user).should eq(@user)
      end

      it "redirects to the user" do
        put :update, {:id => @user.to_param, :user => valid_attributes}
        response.should redirect_to(@user)
      end
    end

    describe "with invalid params" do
      it "assigns the user as @user" do
        User.any_instance.stub(:save).and_return(false)
        put :update, {:id => @user.to_param, :user => {  }}
        assigns(:user).should eq(@user)
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested user" do
      expect {
        delete :destroy, {:id => @user.to_param}
      }.to change(User, :count).by(-1)
    end
  end

end
