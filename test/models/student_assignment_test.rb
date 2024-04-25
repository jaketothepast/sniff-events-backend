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

    sa.cheat_score = 101
    assert_equal false, sa.save

    (1..100).each do |score|
      sa.cheat_score = score
      assert sa.save
    end
  end
end
