require "test_helper"

class AssignmentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get assignments_index_url
    assert_response :success
    assert_select 'td', 'MyString'
  end

  test "should get show" do
    assignment = assignments(:one)
    get assignments_show_url(assignment.id)
    assert_response :success
  end

  test "index has num_fixtures assignments" do
    count = Assignment.all.count
    get assignments_index_url
    assert_select 'td', count * 2 # Number of fields in a row.
  end
end
