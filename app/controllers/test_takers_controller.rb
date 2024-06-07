class TestTakersController < ApplicationController
  before_action :require_login
  before_action :check_user_scope
  before_action :check_test_permissions, only: %i[delete]
  before_action :set_test, only: %i[new index create]

  def new
    @test_taker = TestTaker.new
  end

  def index
    @test_takers = @test.test_takers
  end

  def create
    @test_taker = @test.test_takers.create(test_taker_params)
    if @test_taker
      respond_to do |format|
        format.turbo_stream
      end
    else
      # TODO: Handle error
    end
  end

  private
  # TODO: Check that the user has permission on the current test.
  def set_test
    @test = Test.find(params[:test_id])
  end

  def test_taker_params
    params.require(:test_taker).permit(:email)
  end
end
