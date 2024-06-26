class AdminController < ApplicationController
  # Specify using our admin layout specifically
  layout "admin_layout"

  before_action :require_login
  before_action :check_user_scope
  before_action :set_test, only: %i[deploy]

  def index
  end

  ##
  # Manage tests
  #
  def tests
    @tests = Test.all
  end

  def deploy
    if request.patch?
      @test.active = test_params[:active]
      @test.save
      return redirect_to admin_tests_url
    end
  end

  private
  def set_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:active)
  end
end
