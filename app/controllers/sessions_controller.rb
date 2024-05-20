class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  def new
    # Output the redirect url
  end

  def create
  end

  def destroy
  end

  private

  def required_params
    param.permit!(:redirect_url)
  end
end
