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

  test "We are forbidden based on user scope" do
    # POst to the login endpoint
    post login_session_path(redirect_url: admin_index_path), params: { name: "Dumb User", password: "secret" }

    # Try to get the admin URL
    get admin_index_url

    # We were sent to /not_found
    assert_redirected_to "/not_found"
  end

  test "Deploy test can view page" do
    post login_session_path(redirect_url: admin_index_path), params: { name: "Super Duper Admin Guy", password: "secret" }
    get admin_test_deploy_url(tests(:one))
    assert_response :success
    assert_select "h1", "Deploy MyFirstTest"
  end

  test "New test is not active" do
    post login_session_path(redirect_url: admin_index_path), params: { name: "Super Duper Admin Guy", password: "secret" }
    get admin_tests_url
    assert_response :success
    assert_select "td", "false"

    # We also have an active test, thanks to fixtures
    assert_select "td", "true"
  end

  test "Deploy test changes deploy status" do
    post login_session_path(redirect_url: admin_index_path), params: { name: "Super Duper Admin Guy", password: "secret" }
    get admin_test_deploy_url(tests(:one))

    # Post to the admin deploy method
    patch admin_test_deploy_edit_url(tests(:one)), params: { test: { active: true } }
    assert_redirected_to admin_tests_url

    # # Assert that there are no falses on the page.
    assert_select "td", { text: "true", count: 2 }
    #assert_select "td"
  end

end
