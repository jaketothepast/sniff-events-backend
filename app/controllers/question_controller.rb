class QuestionController < ApplicationController
  layout "admin_layout"
  before_action :require_login
  before_action :check_user_scope

  def new
    @question = Question.new(test_id: params[:test_id])

    respond_to do |format|
      format.turbo_stream
    end
  end

  def create
  end

  def show
  end

  def update
  end

  def delete
  end
end
