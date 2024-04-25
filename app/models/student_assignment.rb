class StudentAssignment < ApplicationRecord
  belongs_to :student
  belongs_to :assignment

  # The event stream for a given assignment student pair lives here.
  has_many :events
end
