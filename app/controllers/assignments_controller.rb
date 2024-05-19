class AssignmentsController < ApplicationController
  before_action :set_assignment, only: %i[show]
  skip_before_action :require_login

  # Show all assignments in a table format.
  def index
    @assignments = Assignment.all
  end

  # Show a specific assignment.
  def show
  end

  private

  def set_assignment
    @assignment = Assignment.find(params[:id])
  end
end
