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

  test "show contains 1 student" do
    assignment = assignments(:one)
    get assignments_show_url(assignment.id)
    assert_select '.student-assignment', 1
    assert_select '.student-assignment td', 3
    assert_select '.student-assignment td:nth-child(1)', { text: students(:one).name }
  end

  test "has one red row" do
    assignment = assignments(:one)
    get assignments_show_url(assignment.id)
    assert_select '.bg-red-300', 1
  end
end
