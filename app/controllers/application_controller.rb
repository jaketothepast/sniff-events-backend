class ApplicationController < ActionController::Base

  before_action :require_login

  private

  def require_login
    if session[:user_id].nil?
      flash[:error] = "Must be logged in to view this page"
      redirect_to login_path(redirect_url: request.fullpath)
      return
    end

    # If we are logged in, set the user.
    @user = User.find(session[:user_id])
  end
end
