require "test_helper"

class QuestionTest < ActiveSupport::TestCase
  test "is multiple choice" do
    assert questions(:one).type == :multiple_choice
  end


  test "is select all that apply" do
    assert questions(:two).type == :select_all_that_apply
  end


  test "is incomplete" do
    assert questions(:no_choices).type == :incomplete
  end
end
