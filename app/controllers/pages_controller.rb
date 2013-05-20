class PagesController < InheritedResources::Base
  before_filter :redirect_if_logged_in

  protected
    def redirect_if_logged_in
      redirect_to user_path(current_user) if user_signed_in?
    end
end
