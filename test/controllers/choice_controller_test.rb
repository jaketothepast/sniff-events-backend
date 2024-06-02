require "test_helper"

class ChoiceControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get choice_create_url
    assert_response :success
  end

  test "should get show" do
    get choice_show_url
    assert_response :success
  end

  test "should get update" do
    get choice_update_url
    assert_response :success
  end

  test "should get delete" do
    get choice_delete_url
    assert_response :success
  end
end
