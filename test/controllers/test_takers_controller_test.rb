require "test_helper"

class TestTakersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get test_takers_new_url
    assert_response :success
  end

  test "should get index" do
    get test_takers_index_url
    assert_response :success
  end
end
