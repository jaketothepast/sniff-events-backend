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
    @question = Question.new(test_id: params[:test].to_i, **question_params)
    if @question.save
      respond_to do |format|
        format.turbo_stream
      end
    else
    end
  end

  def show
  end

  def update
  end

  def delete
  end

  private

  def question_params
    params.require(:question).permit(:text)
  end
end
