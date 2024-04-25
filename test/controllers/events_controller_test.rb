require "test_helper"

class EventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event = events(:one)
  end

  test "should create event" do
    assert_difference("Event.count") do
      post events_url,
           params: { assignment_id: @event.assignment_id, student_id: @event.student_id, event_type: "click-and-drag" }, as: :json
    end

    assert_response :created
  end

end
