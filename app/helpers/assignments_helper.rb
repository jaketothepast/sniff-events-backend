module AssignmentsHelper
  # Get the color class for a student's cheat score
  def cheat_color(student_assignment)
    unless student_assignment.cheat_score == 0
      'bg-red-300'
    end
  end
end
