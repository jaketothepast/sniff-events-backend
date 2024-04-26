require "test_helper"

class StudentAssignmentControllerTest < ActionDispatch::IntegrationTest
  test "should get feed" do
    # Test data
    get student_assignments_view_events_url(student_assignments(:two).id)
    assert_response :success
  end


  test "should show events" do
    # Test data
    get student_assignments_view_events_url(student_assignments(:two).id)
    assert_response :success

    assert_select 'li', 2
    assert_select '.underline', 1
  end
end
