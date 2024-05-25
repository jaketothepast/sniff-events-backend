class AdminController < ApplicationController
  # Specify using our admin layout specifically
  layout "admin_layout"

  before_action :require_login
  before_action :check_user_scope

  def index
  end

  private

  # TODO: Maybe move this one day to the application controller?
  def check_user_scope
    unless User.permissions[@user.permissions] > 0
      redirect_to not_found_url
    end
  end
end
