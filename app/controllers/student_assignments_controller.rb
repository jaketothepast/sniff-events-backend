class StudentAssignmentsController < ApplicationController
  before_action :set_student_assignment
  skip_before_action :require_login

  # A feed of all events from the page.
  def feed
  end

  private

  def set_student_assignment
    @student_assignment = StudentAssignment.find(params[:id])
  end
end
