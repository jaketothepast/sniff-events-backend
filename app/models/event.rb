class Event < ApplicationRecord
  belongs_to :student
  belongs_to :assignment

  enum event_type: { click: 0, click_and_drag: 1, clipboard: 2, visibility: 3, start: 4 }

  def self.from_type(student:, assignment:, event_type:)
    e = Event.new
    e.student = student
    e.assignment = assignment
    e.event_type = case event_type
                 when "click"
                   0
                 when "click-and-drag"
                   1
                 when "clipboard"
                   2
                 when "visibility"
                   3
                 when "start"
                   4
                 else
                   raise ActiveRecord::RecordInvalid.new(e)
                 end
    e
  end
end
