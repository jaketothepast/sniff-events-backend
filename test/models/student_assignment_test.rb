require "test_helper"

class StudentAssignmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  #
  test "won't allow cheat score out of bounds" do
    sa = student_assignments(:one)
    sa.cheat_score = -1
    assert_equal false, sa.save
  end
end
