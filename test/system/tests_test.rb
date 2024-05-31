require "application_system_test_case"

class TestsTest < ApplicationSystemTestCase
  test "Creates a test" do
    admin = users(:one)

    visit admin_index_url
    fill_in "Name", with: admin.name
    fill_in "Password", with: "secret"
    click_on "Login"
    assert_text "Admin#index"
    click_on "Test Management"
    click_on "New Test"
    fill_in "Name", with: "test test"
    fill_in "Description", with: "test description"
    click_on "Submit"

    assert_text "test test"
  end
end
