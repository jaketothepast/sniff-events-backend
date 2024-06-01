class AdminController < ApplicationController
  # Specify using our admin layout specifically
  layout "admin_layout"

  before_action :require_login
  before_action :check_user_scope

  def index
  end

  ##
  # Manage tests
  #
  def tests
    @tests = Test.all
  end
end
