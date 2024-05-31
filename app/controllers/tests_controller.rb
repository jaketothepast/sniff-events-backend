class TestsController < ApplicationController
  # Use our admin layout for this controller
  layout "admin_layout"

  def new
    @test = Test.new
  end

  def create
  end

  def update
  end

  def delete
  end
end
