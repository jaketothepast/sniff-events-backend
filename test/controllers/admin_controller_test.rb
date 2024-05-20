require "test_helper"

class AdminControllerTest < ActionDispatch::IntegrationTest
  test "Admin index not logged in redirects to login" do
    get admin_index_url
    assert_redirected_to sessions_new_path(redirect_url: admin_index_path)
  end
end
