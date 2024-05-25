require "application_system_test_case"

class SessionsTest < ApplicationSystemTestCase
  test "visiting the index" do
    admin = users(:one)

    visit admin_index_url
    fill_in "Name", with: admin.name
    fill_in "Password", with: "secret"
    click_on "Login"
    assert_text "Admin#index"
  end

  test "visiting the tests page" do
    admin = users(:one)

    visit admin_index_url
    fill_in "Name", with: admin.name
    fill_in "Password", with: "secret"
    click_on "Login"

    click_on "Test Management"
    assert_text "ADMIN#TESTS"
  end
end
