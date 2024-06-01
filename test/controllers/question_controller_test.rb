require "test_helper"

class QuestionControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get question_new_url
    assert_response :success
  end

  test "should get create" do
    get question_create_url
    assert_response :success
  end

  test "should get show" do
    get question_show_url
    assert_response :success
  end

  test "should get update" do
    get question_update_url
    assert_response :success
  end

  test "should get delete" do
    get question_delete_url
    assert_response :success
  end
end
