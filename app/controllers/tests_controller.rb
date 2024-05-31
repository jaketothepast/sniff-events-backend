class TestsController < ApplicationController
  # Use our admin layout for this controller
  layout "admin_layout"
  before_action :require_login
  before_action :check_user_scope

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(name: required_params[:name], description: required_params[:description], user: @user)
    if @test.save
      redirect_to admin_tests_url
    else
      @test = Test.new
      render :new
    end
  end

  def update
  end

  def delete
  end

  private
  def required_params
    params.require(:test).permit(:name, :description)
  end
end
