require "test_helper"

class QuestionControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:one)
  end

  test "should get new" do
    post login_session_path, params: { name: @user.name, password: "secret" }
    get question_new_url(tests(:one))
    assert_response :success
  end

  test "should create question" do
    post login_session_path, params: { name: @user.name, password: "secret" }
    test = tests(:two)
    post question_create_path(test), params: { question: { text: "my text" } }
    assert_response :success
  end
end
