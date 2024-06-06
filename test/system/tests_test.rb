require "application_system_test_case"

class TestsTest < ApplicationSystemTestCase


  test "Creates a test, adds question and choices" do
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
    click_on "test test"

    # Add a question
    click_on "Add a Question"
    fill_in "Enter question text", with: "Question text"
    click_on "Add question"
    assert_text "Question text"

    # Add a choice
    # TODO: Figure out clicking the checkbox, and add choice
    fill_in "Choice text:", with: "Choice text"
    click_on "Add choice"
    assert_text "Choice text"

    # Update the choice
    click_on "Edit Choice"
    fill_in "Choice text:", with: "New choice text"
    click_on "Add choice"
    assert_text "New choice text"
  end
end
