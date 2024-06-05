class ChoiceController < ApplicationController
  before_action :require_login
  before_action :check_user_scope
  before_action :set_question, only: %i[index new create]

  def index
    @choices = Choice.where(question_id: params[:question_id])
    respond_to do |format|
      format.html
    end
  end

  def new
    @choice = Choice.new(question_id: params[:question_id])
    respond_to do |format|
      format.turbo_stream
      format.html
    end
  end

  def create
    @choice = Choice.new(choice_params)
    if @choice.save
      respond_to do |format|
        format.turbo_stream
        format.html
      end
    else
      # TODO: Fill out errors.
    end
  end

  def show
  end

  def edit
    @choice = Choice.find(params[:id])
  end

  def update
    @choice = Choice.find(params[:id])
    @choice.update(**choice_params)
    @choice.save
    respond_to do |format|
      format.turbo_stream
    end
  end

  def delete
    @choice = Choice.find(params[:id])
    @choice.destroy
    respond_to do |format|
      format.turbo_stream
    end
  end

  private

  def set_question
    question_id = params[:question_id].nil? ? choice_params[:question_id] : params[:question_id]
    @question = Question.find(question_id)
  end

  def choice_params
    params.require(:choice).permit(:value, :correct, :question_id)
  end
end
