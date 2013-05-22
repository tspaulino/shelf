class Admin::UsersController < AdminController
  inherit_resources

  def index
    @users = User.paginate(:page => params[:page], :per_page => 20)
  end
end
