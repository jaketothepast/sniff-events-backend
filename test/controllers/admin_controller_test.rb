require "test_helper"

class AdminControllerTest < ActionDispatch::IntegrationTest
  test "Admin index not logged in redirects to login" do
    get admin_index_url
    assert_redirected_to login_path(redirect_url: admin_index_path)
  end

  test "Admin controller renders when logged in" do
    post login_session_path(redirect_url: admin_index_path), params: { name: "Super Duper Admin Guy", password: "secret" }
    get admin_index_url
    assert_response :success

    # Select the admin header and determine if it's on page.
    assert_select "h1", "Admin#index"
  end
end
