class QuestionController < ApplicationController
  layout "admin_layout"
  before_action :require_login
  before_action :check_user_scope
  before_action :set_question, only: %i[delete show]
  before_action :check_test_permissions, only: %i[delete]

  def new
    @question = Question.new(test_id: params[:test_id])

    respond_to do |format|
      format.turbo_stream
      format.html
    end
  end

  def create
    @question = Question.new(test_id: params[:test].to_i, **question_params)
    if @question.save
      respond_to do |format|
        format.turbo_stream
        format.html
      end
    else
    end
  end

  def show
  end

  def update
  end

  def delete
    @question = Question.find(params[:id])
    @question.destroy

    respond_to do |format|
      format.turbo_stream
    end
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:text)
  end

  # The question should be in the test and the user that created the test should be the requester.
  def check_test_permissions
    test = Test.find(@question.test_id)
    test&.user == @user
  end
end
