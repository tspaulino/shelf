class UsersController < InheritedResources::Base
  actions :show, :edit, :update, :destroy

  def show
    @user = User.find(params[:id])
  end
end
