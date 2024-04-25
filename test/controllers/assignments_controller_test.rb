require "test_helper"

class AssignmentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get assignments_index_url
    assert_response :success
    assert_select 'div', 'MyString'
  end

  test "should get show" do
    assignment = assignments(:one)
    get assignments_show_url(assignment.id)
    assert_response :success
  end
end
