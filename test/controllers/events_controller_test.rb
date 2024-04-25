require "test_helper"

class EventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event = events(:one)
    @sa = @event.student_assignment
  end

  test "should create event" do
    assert_difference("Event.count") do
      post events_url,
           params: { assignment_id: @sa.assignment_id, student_id: @sa.student_id, event_type: "click-and-drag" }, as: :json
    end

    assert_response :created
  end

end
