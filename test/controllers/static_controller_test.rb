require "test_helper"

class StaticControllerTest < ActionDispatch::IntegrationTest
  test "should get not_found" do
    get not_found_url
    assert_response :success
  end

  test "should get error" do
    get error_url
    assert_response :success
  end
end
