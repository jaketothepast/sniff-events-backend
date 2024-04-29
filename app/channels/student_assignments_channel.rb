class StudentAssignmentsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "student_assignments"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
