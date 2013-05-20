class UsersController < InheritedResources::Base
  actions :show, :edit, :update, :destroy
  before_filter :authenticate_user!
end
