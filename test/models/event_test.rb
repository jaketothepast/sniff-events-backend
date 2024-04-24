require "test_helper"

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  #
  def setup
    @student = students(:one)
    @assignment = assignments(:one)
  end

  test "should save with different event types" do
    %w[:click-and-drag :click :clipboard].each do |t|
      assert Event.from_type(student: @student, assignment: @assignment, event_type: t).save, "could not save event"
    end
  end

  test "should be invalid with invalid type" do
    assert_raises(ActiveRecord::RecordInvalid) do
      Event.from_type(student: @student, assignment: @assignment, event_type: ":bleh").save
    end
  end
end
