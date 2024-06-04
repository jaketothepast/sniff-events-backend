class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  def new
    # Output the redirect url
  end

  def create
    user = User.find_by(name: params[:name])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      if params[:redirect_url].nil?
        render status: 204
      else
        redirect_to params[:redirect_url]
      end
    else
      redirect_to login_url, alert: 'Invalid login'
    end
  end

  def destroy
  end

  private

  def required_params
    param.permit!(:redirect_url)
  end
end
