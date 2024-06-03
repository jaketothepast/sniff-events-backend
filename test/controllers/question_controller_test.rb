require "test_helper"

class QuestionControllerTest < ActionDispatch::IntegrationTest

  def setup
  end

  test "should get new" do
    post login_session_path, params: { name: "Super Duper Admin Guy", password: "secret", redirect_url: tests_show_path(tests(:two)) }
    get question_new_url
    assert_response :success
  end

  test "should create question" do
    test = tests(:two)
    post question_create_path(test), params: { text: "my text" }
    assert_response :success
  end
end
