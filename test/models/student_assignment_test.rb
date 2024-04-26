require "test_helper"

class StudentAssignmentTest < ActiveSupport::TestCase

  test "updates cheat score properly" do
    sa = student_assignments(:one)
    # This should update sa
    sa.new_event("click-and-drag")
    assert_equal StudentAssignment::EVENT_WEIGHTS[:click_and_drag] + 1, sa.cheat_score
    sa.new_event("click")
    assert_equal 7, sa.cheat_score

    25.times do
      sa.new_event("click-and-drag")
    end

    assert_equal 100, sa.cheat_score
  end
end
