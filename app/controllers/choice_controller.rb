class ChoiceController < ApplicationController
  before_action :require_login
  before_action :check_user_scope
  before_action :set_question

  def new
    @choice = Choice.new(question_id: params[:question_id])

    puts "HERE IN DEBUGGING"
    respond_to do |format|
      format.turbo_stream
      format.html
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

  private

  def set_question
    @question = Question.find(params[:question_id])
  end
end
