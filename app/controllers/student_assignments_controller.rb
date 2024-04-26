class StudentAssignmentsController < ApplicationController
  before_action :set_student_assignment

  # A feed of all events from the page.
  def feed
  end

  private

  def set_student_assignment
    @student_assignment = StudentAssignment.find(params[:id])
  end
end
