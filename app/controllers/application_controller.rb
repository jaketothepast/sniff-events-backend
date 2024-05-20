class ApplicationController < ActionController::Base

  before_action :require_login

  private

  def logged_in?
    !session[:user_id].nil?
  end

  def require_login
    unless logged_in?
      flash[:error] = "Must be logged in to view this page"
      redirect_to login_path(redirect_url: request.fullpath)
    end
  end
end
