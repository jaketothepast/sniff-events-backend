class StudentAssignment < ApplicationRecord
  belongs_to :student
  belongs_to :assignment

  # The event stream for a given assignment student pair lives here.
  has_many :events

  # Creates a new event linked to the student assignment. Will parse the type.
  def new_event(event_type)
    events.create(event_type: Event.type_from(event_type))
  end
end
