class StudentAssignment < ApplicationRecord
  belongs_to :student
  belongs_to :assignment

  # The event stream for a given assignment student pair lives here.
  has_many :events

  EVENT_WEIGHTS = {
    click_and_drag: 5,
    visibility: 3,
    clipboard: 3,
    copy: 5,
    paste: 5,
    click: 0
  }

  # Creates a new event linked to the student assignment. Will parse the type.
  def new_event(event_type)
    events.create(event_type: Event.type_from(event_type))
  end

  # Calculate the cheat score for this student assignment
  def cheat_score
    raw = events.map{ |e| EVENT_WEIGHTS[e.event_type.to_sym] }.sum
    [raw, 100].min
  end
end
